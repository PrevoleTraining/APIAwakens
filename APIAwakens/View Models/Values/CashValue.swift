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
    
    private var value: Int
    private var unit: Unit = .credits
    
    var rate: Double = 1.0

    init(valueInCredits: Int) {
        self.value = valueInCredits
    }
    
    var formatedValue: String {
        if value > -1 {
            switch unit {
            case .usd: return "$\(Double(value) * rate)"
            case .credits: return "\(value)"
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
        return value >= 0
    }
}
