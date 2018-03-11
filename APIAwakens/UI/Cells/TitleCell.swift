//
//  TitleCell.swift
//  APIAwakens
//
//  Created by lprevost on 04.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import UIKit

class TitleCell: UITableViewCell {
    static var reuseIdentifier = "TitleCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Helpers
    
    func update(label: String) {
        titleLabel.text = label
    }
}
