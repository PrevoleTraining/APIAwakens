//
//  CashValue.swift
//  APIAwakens
//
//  Created by lprevost on 03.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

struct CashValue: DataValue {
    enum Unit: String {
        case usd = "usd"
        case credits = "credits"
    }
    
    private var value: Int?
    private var unit: Unit = .credits
    
    private let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.groupingSeparator = "'"
        formatter.groupingSize = 3
        formatter.usesGroupingSeparator = true
        return formatter
    }()
    
    var rate: Double = 1.0

    init(valueInCredits: Int?) {
        self.value = valueInCredits
    }
    
    var formatedValue: String {
        if let value = value {
            switch unit {
            case .usd: return "$ \(formatter.string(from: (Double(value) * rate) as NSNumber)!)"
            case .credits: return formatter.string(from: value as NSNumber)!
            }
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
    
    func isPositive() -> Bool {
        guard let value = value else {
            return false
        }
        
        return value >= 0
    }
}
