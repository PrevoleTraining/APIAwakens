//
//  StarshipResource.swift
//  APIAwakens
//
//  Created by lprevost on 11.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class StarshipResource: Resource {
    func decodeAll(from: Data) throws -> [Sizable] {
        do {
            return try JSONDecoder().decode(DownloadEntity<Starship>.self, from: from).entities
        } catch {
            fatalError()
        }
    }
    
    func getAll(completion: @escaping ([Sizable]?, SWAPIError?) -> Void) {
        all(endpoint: SWAPIBaseEndpoint.starships, completion: completion)
    }
}
