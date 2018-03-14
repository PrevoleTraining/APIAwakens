//
//  Endpoint.swift
//  APIAwakens
//
//  Created by lprevost on 08.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String? { get }
}

extension Endpoint {
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        
        if let path = path {
            components.path = path
        }
        
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}

enum SWAPIBaseEndpoint: String, Endpoint {
    case people
    case vehicles
    case starships
    case planets
}

extension SWAPIBaseEndpoint {
    var base: String {
        return "https://swapi.co"
    }
    
    var path: String? {
        return "/api/\(self.rawValue)/"
    }
}

struct RawEndpoint: Endpoint {
    let rawUrl: String
}

extension RawEndpoint {
    var base: String {
        return rawUrl
    }
    
    var path: String? {
        return nil
    }
}
