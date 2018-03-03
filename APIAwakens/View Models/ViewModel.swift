//
//  ViewModel.swift
//  APIAwakens
//
//  Created by lprevost on 03.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

protocol ViewModel {
    typealias LabelValue = (label: String, value: DataValue, cellIdentifier: String)
    
    var name: String { get }
    var data: [LabelValue] { get }
}
