//
//  SpeciesResource.swift
//  APIAwakens
//
//  Created by lprevost on 17.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class SpeciesResource: Resource {
    let resource = ResourceEngine<Species>(endpoint: SWAPIEndpoint.species)
    
    func getOne(url: String, completion: @escaping (Classifiable?, SWAPIError?) -> Void) {
        resource.getOne(url: url, completion: completion)
    }
    
    func getAll(completion: @escaping ([Classifiable]?, SWAPIError?) -> Void) {
        resource.getAll(completion: completion)
    }
}
