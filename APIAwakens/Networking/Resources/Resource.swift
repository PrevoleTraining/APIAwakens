//
//  Resource.swift
//  APIAwakens
//
//  Created by lprevost on 07.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

protocol Resource {
    func getOne(url: String, completion: @escaping (Sizable?, SWAPIError?) -> Void)
    func getAll(completion: @escaping ([Sizable]?, SWAPIError?) -> Void)
}

class ResourceEngine<Entity: Decodable & Sizable> {
    typealias AllEntitiesHandler = ([Sizable]?, SWAPIError?) -> Void
    typealias OneEntityHandler = (Sizable?, SWAPIError?) -> Void
    
    let endpoint: SWAPIEndpoint
    
    init(endpoint: SWAPIEndpoint) {
        self.endpoint = endpoint
    }

    func getOne(url stringUrl: String, completion: @escaping OneEntityHandler) {
        if let sizable = Cache.get(id: stringUrl) {
            completion(sizable, nil)
            return
        }
        
        guard let url = URL(string: stringUrl) else {
            completion(nil, .wrongUrlFormat)
            return
        }
        
        let task = JSONDownloader().jsonTask(with: url) { data, error in
            DispatchQueue.main.async {
                guard let data = data else {
                    return completion(nil, error)
                }
                
                do {
                    let entity = try JSONDecoder().decode(Entity.self, from: data)
                    Cache.put(entity: entity)
                    completion(entity, nil)
                } catch {
                    completion(nil, .jsonConversionFailure(error: error))
                }
            }
        }
        
        task.resume()
    }
    
    func getAll(completion: @escaping AllEntitiesHandler) {
        if let sizables = Cache.getCollection(endpoint: endpoint) {
            completion(sizables, nil)
            return
        }
        
        let task = JSONDownloader().jsonTask(with: endpoint.request) { data, error in
            DispatchQueue.main.async {
                guard let data = data else {
                    return completion(nil, error)
                }
                
                do  {
                    let paginatedResult = try self.decodeAll(from: data)
                    
                    if let _ = paginatedResult.next {
                        self.getAllRemaining(paginatedResult: paginatedResult, completion: completion)
                    } else {
                        completion(paginatedResult.entities, nil)
                    }
                } catch {
                    completion(nil, .jsonConversionFailure(error: error))
                }
            }
        }
        
        task.resume()
    }
    
    private func decodeOne(from data: Data) throws -> Entity {
        return try JSONDecoder().decode(Entity.self, from: data)
    }
    
    private func decodeAll(from data: Data) throws -> PaginatedResult {
        let result = try JSONDecoder().decode(DownloadEntity<Entity>.self, from: data)
        return PaginatedResult(total: result.count, next: result.next, entities: result.entities)
    }
    
    private func getAllRemaining(paginatedResult: PaginatedResult, completion: @escaping AllEntitiesHandler) {
        let operationQueue: OperationQueue = OperationQueue()
        operationQueue.cancelAllOperations()
        
        var result: [Sizable] = paginatedResult.entities
        
        let queueCompletionOperation = BlockOperation {
            DispatchQueue.main.async {
                Cache.putCollection(endpoint: self.endpoint, collection: result)
                completion(result, nil)
            }
        }
        
        var operations: [Operation] = []
        
        operationQueue.isSuspended = true
        
        let nbPages = Int(ceil(Double(paginatedResult.total) / Double(paginatedResult.entities.count)))
        
         // Remove the page number
        let endIndex = paginatedResult.next!.index(before: paginatedResult.next!.endIndex)
        let baseUrl = String(describing: paginatedResult.next![..<endIndex])
        
        // Page numbering starts at 1 and first page already downloaded
        for page in 2...nbPages {
            let pageUrl = "\(baseUrl)\(page)"
            let getOp = GetOperation(url: URL(string: pageUrl)!)
            
            getOp.completionBlock = {
                if let data = getOp.data {
                    DispatchQueue.global().sync(flags: .barrier) {
                        do {
                            result = try result + self.decodeAll(from: data).entities
                        } catch let error as SWAPIError {
                            operationQueue.cancelAllOperations()
                            completion(nil, error)
                        } catch {
                            operationQueue.cancelAllOperations()
                            completion(nil, .unknown(error: error))
                        }
                    }
                }
                
                if let error = getOp.error {
                    DispatchQueue.global().sync(flags: .barrier) {
                        operationQueue.cancelAllOperations()
                        completion(nil, error)
                    }
                }
            }
            
            queueCompletionOperation.addDependency(getOp)
            operations.append(getOp)
        }
        
        operations.append(queueCompletionOperation)
        
        operationQueue.addOperations(operations, waitUntilFinished: false)
        operationQueue.isSuspended = false
    }
}

struct PaginatedResult {
    let total: Int
    let next: String?
    let entities: [Sizable]
}
