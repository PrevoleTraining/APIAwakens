//
//  Cache.swift
//  APIAwakens
//
//  Created by lprevost on 14.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

struct Cache {
    static var sizables: [String: Sizable] = [:]
    static var collections: [SWAPIEndpoint: [Sizable]] = [:]
    
    static func get(id: String) -> Sizable? {
        return sizables[id]
    }
    
    static func put(entity: Sizable) -> Void {
        if let _ = sizables[entity.id] {
            return
        }
        
        sizables.updateValue(entity, forKey: entity.id)
    }
    
    static func getCollection(endpoint: SWAPIEndpoint) -> [Sizable]? {
        return collections[endpoint]
    }
    
    static func putCollection(endpoint: SWAPIEndpoint, collection: [Sizable]) -> Void {
        if let _ = collections[endpoint] {
            return
        }
        
        collections.updateValue(collection, forKey: endpoint)
        
        collection.forEach { put(entity: $0) }
    }
}
