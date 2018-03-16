//
//  UnitUIButton.swift
//  APIAwakens
//
//  Created by lprevost on 02.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import UIKit

class UnitUIButton: UIButton {
    var unit: MetricValue.UnitType = .metric
    
    @IBInspectable
    var unitAdapter: String? {
        willSet {
            if let unit = MetricValue.UnitType(rawValue: newValue?.lowercased() ?? "") {
                self.unit = unit
            }
        }
    }
}
