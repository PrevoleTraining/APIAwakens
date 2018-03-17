//
//  SWCharacterResource.swift
//  APIAwakens
//
//  Created by lprevost on 08.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class SWCharacterResource: Resource {
    let resource = ResourceEngine<SWCharacter>(endpoint: SWAPIEndpoint.people)

    func getOne(url: String, completion: @escaping (Classifiable?, SWAPIError?) -> Void) {
        resource.getOne(url: url, completion: completion)
    }
    
    func getAll(completion: @escaping ([Classifiable]?, SWAPIError?) -> Void) {
        resource.getAll(completion: completion)
    }
}
