//
//  MovieResource.swift
//  APIAwakens
//
//  Created by lprevost on 17.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class MovieResource: Resource {
    let resource = ResourceEngine<Movie>(endpoint: SWAPIEndpoint.movies)
    
    func getOne(url: String, completion: @escaping (Classifiable?, SWAPIError?) -> Void) {
        resource.getOne(url: url, completion: completion)
    }
    
    func getAll(completion: @escaping ([Classifiable]?, SWAPIError?) -> Void) {
        resource.getAll(completion: completion)
    }
}
