//
//  RomanValue.swift
//  APIAwakens
//
//  Created by lprevost on 17.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

struct RomanValue: DataValue {
    var value: Int
    
    var formatedValue: String {
        return value.roman
    }
}
