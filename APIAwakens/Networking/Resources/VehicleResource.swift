//
//  VehiclesResource.swift
//  APIAwakens
//
//  Created by lprevost on 11.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class VehicleResource: Resource {
    let resource = ResourceEngine<Vehicle>(endpoint: SWAPIBaseEndpoint.vehicles)
    
    func getOne(url: String, completion: @escaping (Sizable?, SWAPIError?) -> Void) {
        resource.getOne(url: url, completion: completion)
    }
    
    func getAll(completion: @escaping ([Sizable]?, SWAPIError?) -> Void) {
        resource.getAll(completion: completion)
    }
}
