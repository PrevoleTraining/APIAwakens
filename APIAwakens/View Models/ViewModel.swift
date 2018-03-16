//
//  ViewModel.swift
//  APIAwakens
//
//  Created by lprevost on 03.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

struct ViewModel {
    typealias LabelValue = (label: String?, value: DataValue, cellIdentifier: String)
    
    let name: String
    let data: [LabelValue]
}
