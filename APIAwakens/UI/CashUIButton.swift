//
//  CashUIButton.swift
//  APIAwakens
//
//  Created by lprevost on 03.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import UIKit

class CashUIButton: UIButton {
    var unit: CashValue.Unit = .credits
    
    @IBInspectable
    var unitAdapter: String? {
        willSet {
            if let unit = CashValue.Unit(rawValue: newValue?.lowercased() ?? "") {
                self.unit = unit
            }
        }
    }
}
