//
//  EnglishMetricDataValue.swift
//  APIAwakens
//
//  Created by lprevost on 03.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

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
