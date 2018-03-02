//
//  DataValue.swift
//  APIAwakens
//
//  Created by lprevost on 25.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

let oneInchInCentimerMeter = 2.54

protocol DataValue {
    var formatedValue: String { get }
}

struct StringValue: DataValue {
    var value: String
    
    var formatedValue: String {
        return value
    }
}

struct EnglishMetricValue: DataValue {
    enum Unit: String {
        case metric = "metric"
        case english = "english"
    }
    
    private var value: Double
    private var unit: Unit = .metric
    
    init(valueInCm: Double) {
        self.value = valueInCm
    }
    
    var formatedValue: String {
        switch unit {
        case .metric: return "\(value / 100)m"
        case .english: return "\(value * oneInchInCentimerMeter / 100)\""
        }
    }
    
    func isUnit(_ unit: Unit) -> Bool {
        return self.unit == unit
    }
    
    mutating func change(unit: Unit) {
        self.unit = unit
    }
}
