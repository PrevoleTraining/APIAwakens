//
//  JSONDownloader.swift
//  APIAwakens
//
//  Created by lprevost on 07.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class JSONDownloader {
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    typealias JSONTaskCompletionHandler = (Data?, SWAPIError?) -> Void
    
    func jsonTask(with request: URLRequest, completionHandler completion: @escaping JSONTaskCompletionHandler) -> URLSessionDataTask {
        return session.dataTask(with: request) { data, response, error in
            self.handleResponse(data: data, response: response, error: error, completion: completion)
        }
    }

    func jsonTask(with url: URL, completionHandler completion: @escaping JSONTaskCompletionHandler) -> URLSessionDataTask {
        return session.dataTask(with: url) { data, response, error in
            self.handleResponse(data: data, response: response, error: error, completion: completion)
        }
    }
    
    private func handleResponse(data: Data?, response: URLResponse?, error: Error?, completion: @escaping JSONTaskCompletionHandler) -> Void {
        guard let httpResponse = response as? HTTPURLResponse else {
            completion(nil, .requestFailed)
            return
        }
        
        if httpResponse.statusCode == 200 {
            if let data = data {
                completion(data, nil)
            } else {
                completion(nil, .noData)
            }
        } else {
            completion(nil, .responseUnsuccessful)
        }
    }
}
