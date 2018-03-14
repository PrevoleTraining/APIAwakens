//
//  Endpoint.swift
//  APIAwakens
//
//  Created by lprevost on 08.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

enum SWAPIEndpoint: String {
    case people
    case vehicles
    case starships
    case planets
}

extension SWAPIEndpoint {
    var base: String {
        return "https://swapi.co"
    }
    
    var path: String? {
        return "/api/\(self.rawValue)/"
    }
    
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
