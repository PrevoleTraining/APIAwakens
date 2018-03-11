//
//  ModalDelegate.swift
//  APIAwakens
//
//  Created by lprevost on 03.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

protocol RateModalDelegate: class {
    var rate: Double { get }
    
    func confirm(rate: Double)
}
