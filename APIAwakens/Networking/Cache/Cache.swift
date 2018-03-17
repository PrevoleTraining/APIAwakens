//
//  Cache.swift
//  APIAwakens
//
//  Created by lprevost on 14.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

struct Cache {
    static var sizables: [String: Classifiable] = [:]
    static var collections: [SWAPIEndpoint: [Classifiable]] = [:]
    
    static func get(id: String) -> Classifiable? {
        return sizables[id]
    }
    
    static func put(entity: Classifiable) -> Void {
        if let _ = sizables[entity.id] {
            return
        }
        
        sizables.updateValue(entity, forKey: entity.id)
    }
    
    static func getCollection(endpoint: SWAPIEndpoint) -> [Classifiable]? {
        return collections[endpoint]
    }
    
    static func putCollection(endpoint: SWAPIEndpoint, collection: [Classifiable]) -> Void {
        if let _ = collections[endpoint] {
            return
        }
        
        collections.updateValue(collection, forKey: endpoint)
        
        collection.forEach { put(entity: $0) }
    }
}
