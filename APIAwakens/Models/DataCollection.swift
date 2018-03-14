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

    private var onlyWithSize: [Sizable] {
        return sizables.filter({ (item) -> Bool in
            if let _ = item.size {
                return true
            } else {
                return false
            }
        })
    }
    
    var smallest: String {
        if let smallest = onlyWithSize.min(by: self.closure) {
            return smallest.name
        } else {
            return "n/a"
        }
    }
    
    var largest: String {
        if let largest = onlyWithSize.max(by: self.closure) {
            return largest.name
        } else {
            return "n/a"
        }
    }
    
    var namables: [Namable] {
        return sizables
    }
    
    init(collectionLabel: String, sizables: [Sizable]) {
        self.sizables = sizables
        self.collectionLabel = collectionLabel
    }
}

