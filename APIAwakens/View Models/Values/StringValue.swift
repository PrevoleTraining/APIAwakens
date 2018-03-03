//
//  StringValue.swift
//  APIAwakens
//
//  Created by lprevost on 03.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

struct StringValue: DataValue {
    var value: String
    
    var formatedValue: String {
        return value
    }
}
