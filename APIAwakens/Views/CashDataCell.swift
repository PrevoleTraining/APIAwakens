//
//  CashDataCell.swift
//  APIAwakens
//
//  Created by lprevost on 03.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation
import UIKit

class CashDataCell: UITableViewCell, RateModalDelegate {
    static let reuseIdentifier = "CashDataCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var usdButton: CashUIButton!
    @IBOutlet weak var creditshButton: CashUIButton!
    
    lazy var buttons: [CashUIButton] = {
        return [ usdButton, creditshButton ]
    }()
    
    private var cashValue: CashValue?
    
    var rate: Double {
        guard let cashValue = cashValue else {
            return 1.0
        }
        
        return cashValue.rate
    }
    
    func confirm(rate: Double) {
        cashValue?.rate = rate
        update(unit: .usd)
    }
    
    // MARK: - Actions
    
    @IBAction func toCredits(_ sender: CashUIButton) {
        update(unit: .credits)
    }
    
    // MARK: - Helpers
    
    func update(label: String, cashValue: CashValue) {
        titleLabel.text = label
        self.cashValue = cashValue
        
        for button in buttons {
            configureButton(button)
        }
        
        update(unit: nil)
    }
    
    private func update(unit: CashValue.Unit?) {
        if var cashValue = cashValue {
            if let unit = unit {
                cashValue.change(unit: unit)
                self.cashValue = cashValue
            }
            
            for button in buttons {
                button.isEnabled = !cashValue.isUnit(button.unit)
                button.isHidden = !cashValue.isPositive()
            }
            
            valueLabel.text = cashValue.formatedValue
        }
    }
    
    private func configureButton(_ button: CashUIButton) {
        button.setTitleColor(.white, for: .disabled)
        button.setTitleColor(.lightGray, for: .normal)
    }
}
