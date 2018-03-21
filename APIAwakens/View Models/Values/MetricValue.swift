//
//  EnglishMetricDataValue.swift
//  APIAwakens
//
//  Created by lprevost on 03.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

let oneInchInCentimeter = 2.54
let oneFootInMeter = 0.3048
let oneMileInKilometer = 1.60934
let onePoundInKilogram = 0.453592
let oneMilePerHourInKilometerPerHour = 1.60934

struct MetricValue: DataValue {
    enum UnitType: String {
        case metric = "metric"
        case english = "english"
    }
    
    enum Scale {
        case centimeter
        case meter
        case kilometer
        case kilogram
        case kilometersPerHour
        
        func converter(type: UnitType) -> ((Double) -> Double) {
            switch type {
            case .metric: return { $0 }
            case .english:
                switch self {
                case .centimeter: return { $0 / oneInchInCentimeter }
                case .meter: return { $0 / oneFootInMeter }
                case .kilometer: return { $0 / oneMileInKilometer }
                case .kilogram: return { $0 / onePoundInKilogram }
                case .kilometersPerHour: return { $0 / oneMilePerHourInKilometerPerHour }
                }
            }
        }
        
        func unit(type: UnitType) -> String {
            switch (type, self) {
            case (.metric, .centimeter): return " cm"
            case (.metric, .meter): return " m"
            case (.metric, .kilometer): return " km"
            case (.metric, .kilogram): return " kg"
            case (.metric, .kilometersPerHour): return " km/h"
            case (.english, .centimeter): return "\""
            case (.english, .meter): return " ft"
            case (.english, .kilometer): return " miles"
            case (.english, .kilogram): return " lb"
            case (.english, .kilometersPerHour): return " mph"
            }
        }
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
    private var scale: Scale
    private var unitType: UnitType = .metric
    
    init(value: Double?, scale: Scale) {
        self.value = value
        self.scale = scale
    }
    
    var formatedValue: String {
        guard let value = value else {
            return "unkown"
        }
        
        let converted = scale.converter(type: unitType)(value)
        let symbol = scale.unit(type: unitType)
        
        return "\(formatter.string(from: converted as NSNumber)!)\(symbol)"
    }
    
    func isUnit(_ unit: UnitType) -> Bool {
        return self.unitType == unit
    }
    
    mutating func change(unit: UnitType) {
        self.unitType = unit
    }
    
    func hasValue() -> Bool {
        return value != nil
    }
}
