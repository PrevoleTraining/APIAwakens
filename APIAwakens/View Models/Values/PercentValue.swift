//
//  PercentValue.swift
//  APIAwakens
//
//  Created by lprevost on 16.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

struct PercentValue: DataValue {
    private let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 0
        formatter.numberStyle = .percent
        formatter.percentSymbol = "%"
        return formatter
    }()

    var value: Double?
    
    init(valueInPerCent: Double?) {
        if let value = valueInPerCent {
            self.value = value / 100.0
        }
    }
    
    var formatedValue: String {
        if let value = value {
            return formatter.string(from: value as NSNumber)!
        } else {
            return "unkown"
        }
    }
}
