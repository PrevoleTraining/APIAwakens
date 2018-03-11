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
    func decodeAll(from: Data) throws -> [Sizable]
}

extension Resource {
    internal func all(endpoint: Endpoint, completion: @escaping ([Sizable]?, SWAPIError?) -> Void) {
        performRequest(with: endpoint.request) { data, error in
            guard let data = data else {
                return completion(nil, error)
            }
            
            do  {
                let results = try self.decodeAll(from: data)
                completion(results, nil)
            } catch {
                completion(nil, .jsonConversionFailure)
            }
        }
    }
    
    internal func get<Entity: Decodable>(endpoint: RawEndpoint, completion: @escaping (Entity?, SWAPIError?) -> Void) {
        performRequest(with: endpoint.request) { data, error in
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
}
