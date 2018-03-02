//
//  UnitUIButton.swift
//  APIAwakens
//
//  Created by lprevost on 02.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import UIKit

class UnitUIButton: UIButton {
    var unit: EnglishMetricValue.Unit = .metric
    
    @IBInspectable
    var unitAdapter: String? {
        willSet {
            if let unit = EnglishMetricValue.Unit(rawValue: newValue?.lowercased() ?? "") {
                self.unit = unit
            }
        }
    }
}
