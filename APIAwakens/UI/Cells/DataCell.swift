//
//  CharacterDataCell.swift
//  APIAwakens
//
//  Created by lprevost on 25.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import UIKit

class DataCell: UITableViewCell {
    static var reuseIdentifier = "DataCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    // MARK: - Helpers
    
    func update(label: String, data: DataValue) {
        titleLabel.text = label
        valueLabel.text = data.formatedValue
    }
}
