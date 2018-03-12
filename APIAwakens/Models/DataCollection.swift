//
//  DataCollection.swift
//  APIAwakens
//
//  Created by lprevost on 03.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class DataCollection {
    private let closure: (Sizable, Sizable) -> Bool = { (left, right) -> Bool in
        if let leftSize = left.size, let rightSize = right.size {
            return leftSize < rightSize
        } else {
            return false
        }
    }
    
    private let sizables: [Sizable]
    
    let collectionLabel: String

    var smallest: Namable {
        return sizables.filter({ (item) -> Bool in
            if let _ = item.size {
                return true
            } else {
                return false
            }
        }).min(by: self.closure)!
    }
    
    var largest: Namable {
        return sizables.max(by: self.closure)!
    }
    
    var namables: [Namable] {
        return sizables
    }
    
    init(collectionLabel: String, sizables: [Sizable]) throws {
        if sizables.count == 0 {
            throw DataCollectionError.noData
        }
        
        self.sizables = sizables
        self.collectionLabel = collectionLabel
    }
}

enum DataCollectionError: Error {
    case noData
}
