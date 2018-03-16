//
//  IntValue.swift
//  APIAwakens
//
//  Created by lprevost on 14.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

struct IntValue: DataValue {
    private var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "'"
        formatter.groupingSize = 3
        formatter.usesGroupingSeparator = true
        return formatter
    }()
    
    var value: Int?
    var suffix: String?
    
    init(value: Int?) {
        self.value = value
    }
    
    init(value: Int?, suffix: String) {
        self.value = value
        self.suffix = suffix
    }
    
    var formatedValue: String {
        if let value = value {
            return "\(formatter.string(from: value as NSNumber)!)\(suffix ?? "")"
        } else {
            return "unkown"
        }
    }
}
