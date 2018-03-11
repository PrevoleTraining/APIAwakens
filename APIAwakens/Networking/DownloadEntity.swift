//
//  DownloadEntity.swift
//  APIAwakens
//
//  Created by lprevost on 08.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class DownloadEntity<Entity: Decodable>: Decodable {
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case entities = "results"
    }
    
    let count: Int
    let next: String?
    let previous: String?
    let entities: [Entity]
    
    init(count: Int, next: String?, previous: String?, entities: [Entity]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.entities = entities
    }
}
