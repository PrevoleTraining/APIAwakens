//
//  DoubleValue.swift
//  APIAwakens
//
//  Created by lprevost on 14.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

struct DoubleValue: DataValue {
    var value: Double?
    
    var formatedValue: String {
        if let value = value {
            return "\(value)"
        } else {
            return "n/a"
        }
    }
}
