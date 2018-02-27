//
//  ToggleDataCell.swift
//  APIAwakens
//
//  Created by lprevost on 27.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation
import UIKit

class ToggleDataCell: UITableViewCell {
    static let reuseIdentifier = "ToggleDataCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var toggleLeftButton: UIButton!
    @IBOutlet weak var toggleRightButton: UIButton!
    
    lazy var toggleButtons = {
        return [ toggleLeftButton, toggleRightButton ]
    }()
    
    private var data: DataValueToggelable?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // MARK: - Actions
    
    @IBAction func toggle(_ sender: UIButton) {
        data!.toggle()
        updateToggleState()
    }
    
    // MARK: - Helpers
    
    func update(label: String, data: DataValueToggelable) {
        titleLabel.text = label
        valueLabel.text = data.formatedValue
        toggleLeftButton.setTitle(data.leftToggleLabel, for: .normal)
        toggleRightButton.setTitle(data.rightToggleLabel, for: .normal)
        self.data = data
        
        for button in toggleButtons {
            configureButton(button!)
        }
        
        updateToggleState()
    }
    
    private func updateToggleState() {
        if let data = data {
            for toggleButton in toggleButtons {
                toggleButton?.isEnabled = !data.isActive(text: toggleButton?.titleLabel?.text)
            }
            
            valueLabel.text = data.formatedValue
        }
    }
    
    private func configureButton(_ button: UIButton) {
        button.setTitleColor(.white, for: .disabled)
        button.setTitleColor(.lightGray, for: .normal)
    }
}
