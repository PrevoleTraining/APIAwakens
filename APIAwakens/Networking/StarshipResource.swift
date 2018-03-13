//
//  StarshipResource.swift
//  APIAwakens
//
//  Created by lprevost on 11.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class StarshipResource: Resource {
    func decodeAll(from: Data) throws -> PaginatedResult {
        let result = try JSONDecoder().decode(DownloadEntity<Starship>.self, from: from)
        return PaginatedResult(total: result.count, next: result.next, entities: result.entities)
    }
    
    func getAll(completion: @escaping ([Sizable]?, SWAPIError?) -> Void) {
        all(endpoint: SWAPIBaseEndpoint.starships, completion: completion)
    }
}
