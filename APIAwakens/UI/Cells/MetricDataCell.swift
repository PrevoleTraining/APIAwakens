//
//  ToggleDataCell.swift
//  APIAwakens
//
//  Created by lprevost on 27.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation
import UIKit

class MetricDataCell: UITableViewCell {
    static let reuseIdentifier = "MetricDataCell"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var metricButton: UnitUIButton!
    @IBOutlet weak var englishButton: UnitUIButton!
    
    lazy var buttons: [UnitUIButton] = {
        return [ englishButton, metricButton ]
    }()
    
    private var metricValue: MetricValue?
    
    // MARK: - Actions
    
    @IBAction func toggle(_ sender: UnitUIButton) {
        update(unit: sender.unit)
    }
    
    // MARK: - Helpers
    
    func update(label: String, metricValue: MetricValue) {
        titleLabel.text = label
        self.metricValue = metricValue
        
        for button in buttons {
            configureButton(button)
        }
        
        update(unit: nil)
    }
    
    private func update(unit: MetricValue.Unit?) {
        if var metricValue = metricValue {
            if let unit = unit {
                metricValue.change(unit: unit)
                self.metricValue = metricValue
            }
            
            for button in buttons {
                button.isEnabled = !metricValue.isUnit(button.unit)
            }
            
            valueLabel.text = metricValue.formatedValue
        }
    }
    
    private func configureButton(_ button: UnitUIButton) {
        button.setTitleColor(.white, for: .disabled)
        button.setTitleColor(.lightGray, for: .normal)
    }
}
