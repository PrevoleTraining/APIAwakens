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

protocol DataValueToggelable: DataValue {
    var leftToggleLabel: String { get }
    var rightToggleLabel: String { get }
    
    mutating func toggle()
    
    func isActive(text: String?) -> Bool
}

struct StringValue: DataValue {
    var value: String
    
    var formatedValue: String {
        return value
    }
}

struct MetricEnglishValue: DataValueToggelable {
    private var valueInCm: Double
    private var isMetric: Bool = true
    
    init(valueInCm: Double) {
        self.valueInCm = valueInCm
    }
    
    var formatedValue: String {
        if isMetric {
            return "\(valueInCm / 100)m"
        } else {
            return "\(valueInCm * oneInchInCentimerMeter / 100)\""
        }
    }
    
    var leftToggleLabel: String {
        return "English"
    }
    
    var rightToggleLabel: String {
        return "Metric"
    }
    
    mutating func toggle() {
        isMetric = !isMetric
    }
    
    func isActive(text: String?) -> Bool {
        if text == nil {
            return false
        } else {
            return (isMetric && "Metric" == text)
                || (!isMetric && "English" == text)
        }
    }
}
