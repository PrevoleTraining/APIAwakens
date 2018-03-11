//
//  NavigationCell.swift
//  APIAwakens
//
//  Created by lprevost on 25.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import UIKit

class NavigationCell: UITableViewCell {
    static var reuseIdentifier = "NavigationCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Helpers
    
    func update(label: String) {
        titleLabel.text = label
    }
}

