//
//  Resource.swift
//  APIAwakens
//
//  Created by lprevost on 07.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

protocol Resource {
    func getAll(completion: @escaping ([Sizable]?, SWAPIError?) -> Void)
    
//    func decodeOne(from: Data) -> Sizable
    func decodeAll(from: Data) throws -> PaginatedResult
}

extension Resource {
    internal func all(endpoint: Endpoint, completion: @escaping ([Sizable]?, SWAPIError?) -> Void) {
        performRequest(with: endpoint.request) { data, error in
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
    
    /*internal func get<Entity: Decodable>(endpoint: RawEndpoint, completion: @escaping (Entity?, SWAPIError?) -> Void) {
        performRequest(with: endpoint.request) { data, error in
            guard let data = data else {
                return completion(nil, error)
            }
            
            do {
                let result = try JSONDecoder().decode(Entity.self, from: data)
                
                if let _ = result.next {
                    getAllRemaining(paginatedResult: result)
                } else {
                    completion(result.entities, nil)
                }
            } catch {
                completion(nil, .jsonConversionFailure)
            }
        }
    }*/
    
    private func performRequest(with endpoint: URLRequest, completion: @escaping (Data?, SWAPIError?) -> Void) {
        let task = JSONDownloader().jsonTask(with: endpoint) { data, error in
            DispatchQueue.main.async {
                guard let data = data else {
                    completion(nil, error)
                    return
                }

                completion(data, nil)
            }
        }
        
        task.resume()
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
