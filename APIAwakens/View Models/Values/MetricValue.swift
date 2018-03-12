//
//  EnglishMetricDataValue.swift
//  APIAwakens
//
//  Created by lprevost on 03.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

let oneFootInMeter = 0.3048

struct MetricValue: DataValue {
    enum Unit: String {
        case metric = "metric"
        case english = "english"
    }
    
    private var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.groupingSeparator = "'"
        formatter.groupingSize = 3
        formatter.usesGroupingSeparator = true
        return formatter
    }()
    
    private var value: Double?
    private var unit: Unit = .metric
    
    init(valueInM: Double?) {
        self.value = valueInM
    }
    
    init(valueInCm: Double?) {
        if let valueInCm = valueInCm {
            self.value = valueInCm / 100.0
        }
    }
    
    var formatedValue: String {
        guard let value = value else {
            return "n/a"
        }
        
        var formattedNumber: String?
        var unitSymbol: String
        
        switch unit {
        case .metric:
            formattedNumber = formatter.string(from: value as NSNumber)
            unitSymbol = "m"
        case .english:
            formattedNumber = formatter.string(from: (value / oneFootInMeter) as NSNumber)
            unitSymbol = "ft"
        }

        if let formattedNumber = formattedNumber {
            return "\(formattedNumber) \(unitSymbol)"
        } else {
            return "n/a"
        }
    }
    
    func isUnit(_ unit: Unit) -> Bool {
        return self.unit == unit
    }
    
    mutating func change(unit: Unit) {
        self.unit = unit
    }
}
