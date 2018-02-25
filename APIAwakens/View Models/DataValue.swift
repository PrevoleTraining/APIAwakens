//
//  DataValue.swift
//  APIAwakens
//
//  Created by lprevost on 25.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

protocol DataValue {
    var formatedValue: String { get }
}

struct StringValue: DataValue {
    var value: String
    
    var formatedValue: String {
        return value
    }
}

struct MetricValue: DataValue {
    var value: Double
    
    var formatedValue: String {
        return "\(value)m"
    }
}
