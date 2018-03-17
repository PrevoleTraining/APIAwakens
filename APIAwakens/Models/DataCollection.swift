//
//  DataCollection.swift
//  APIAwakens
//
//  Created by lprevost on 03.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class DataCollection {
    private let closure: (Classifiable, Classifiable) -> Bool = { (left, right) -> Bool in
        if let leftSize = left.classifierWeight, let rightSize = right.classifierWeight {
            return leftSize < rightSize
        } else {
            return false
        }
    }
    
    private let sizables: [Classifiable]
    
    let collectionLabel: String

    private var onlyWithSize: [Classifiable] {
        return sizables.filter({ (item) -> Bool in
            if let _ = item.classifierWeight {
                return true
            } else {
                return false
            }
        })
    }
    
    var first: Classifiable? {
        return onlyWithSize.max(by: self.closure)
    }
    
    var last: Classifiable? {
        return onlyWithSize.min(by: self.closure)
    }
    
    var namables: [Namable] {
        return sizables
    }
    
    init(collectionLabel: String, sizables: [Classifiable]) {
        self.sizables = sizables.sorted(by: { (left, right) -> Bool in
            return left.name < right.name
        })
        self.collectionLabel = collectionLabel
    }
}

