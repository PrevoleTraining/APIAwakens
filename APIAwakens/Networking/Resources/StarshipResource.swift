//
//  StarshipResource.swift
//  APIAwakens
//
//  Created by lprevost on 11.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class StarshipResource: Resource {
    let resource = ResourceEngine<Starship>(endpoint: SWAPIEndpoint.starships)
    
    func getOne(url: String, completion: @escaping (Classifiable?, SWAPIError?) -> Void) {
        resource.getOne(url: url, completion: completion)
    }
    
    func getAll(completion: @escaping ([Classifiable]?, SWAPIError?) -> Void) {
        resource.getAll(completion: completion)
    }
}
