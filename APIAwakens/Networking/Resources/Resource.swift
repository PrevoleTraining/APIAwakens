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
    let endpoint: Endpoint
    
    init(endpoint: Endpoint) {
        self.endpoint = endpoint
    }

    func getOne(url stringUrl: String, completion: @escaping (Sizable?, SWAPIError?) -> Void) {
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
                    let result = try JSONDecoder().decode(Entity.self, from: data)
                    completion(result, nil)
                } catch {
                    completion(nil, .jsonConversionFailure)
                }
            }
        }
        
        task.resume()
    }
    
    func getAll(completion: @escaping ([Sizable]?, SWAPIError?) -> Void) {
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
                    completion(nil, .jsonConversionFailure)
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
    
    private func getAllRemaining(paginatedResult: PaginatedResult, completion: @escaping ([Sizable]?, SWAPIError?) -> Void) {
        let operationQueue: OperationQueue = OperationQueue()
        operationQueue.cancelAllOperations()
        
        var result: [Sizable] = []
        
        let queueCompletionOperation = BlockOperation {
            DispatchQueue.main.async {
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
                        result = try! result + self.decodeAll(from: data).entities
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
