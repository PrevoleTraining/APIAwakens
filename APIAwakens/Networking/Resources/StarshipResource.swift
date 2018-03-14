//
//  StarshipResource.swift
//  APIAwakens
//
//  Created by lprevost on 11.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class StarshipResource: Resource {
    let resource = ResourceEngine<Starship>(endpoint: SWAPIBaseEndpoint.starships)
    
    func getOne(url: String, completion: @escaping (Sizable?, SWAPIError?) -> Void) {
        resource.getOne(url: url, completion: completion)
    }
    
    func getAll(completion: @escaping ([Sizable]?, SWAPIError?) -> Void) {
        resource.getAll(completion: completion)
    }
}
