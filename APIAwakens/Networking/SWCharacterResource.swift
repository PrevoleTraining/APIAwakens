//
//  SWCharacterResource.swift
//  APIAwakens
//
//  Created by lprevost on 08.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class SWCharacterResource: Resource {
    func decodeAll(from: Data) throws -> [Sizable] {
        return try JSONDecoder().decode(DownloadEntity<SWCharacter>.self, from: from).entities
    }
    
    func getAll(completion: @escaping ([Sizable]?, SWAPIError?) -> Void) {
        all(endpoint: SWAPIBaseEndpoint.people, completion: completion)
    }
}
