//
//  DoubleValue.swift
//  APIAwakens
//
//  Created by lprevost on 14.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

struct NumberValue<NumberType: SignedNumeric>: DataValue {
    private var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.groupingSeparator = "'"
        formatter.groupingSize = 3
        formatter.usesGroupingSeparator = true
        return formatter
    }()

    var value: NumberType?
    var suffix: String?

    init(value: NumberType?) {
        self.value = value
    }
    
    init(value: NumberType?, suffix: String) {
        self.value = value
        self.suffix = suffix
    }

    var formatedValue: String {
        if let value = value, let number = value as? NSNumber {
            return "\(formatter.string(from: number)!)\(suffix ?? "")"
        } else {
            return "unkown"
        }
    }
}
