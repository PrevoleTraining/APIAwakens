//
//  PlanetResource.swift
//  APIAwakens
//
//  Created by lprevost on 13.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class PlanetResource: Resource {
    let resource = ResourceEngine<Planet>(endpoint: SWAPIBaseEndpoint.planets)
    
    func getOne(url: String, completion: @escaping (Sizable?, SWAPIError?) -> Void) {
        resource.getOne(url: url, completion: completion)
    }
    
    func getAll(completion: @escaping ([Sizable]?, SWAPIError?) -> Void) {
        resource.getAll(completion: completion)
    }
}
