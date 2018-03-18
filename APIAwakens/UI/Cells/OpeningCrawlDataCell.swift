//
//  OpeningCrawlDataCell.swift
//  APIAwakens
//
//  Created by lprevost on 17.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import UIKit

class OpeningCrawlDataCell: UITableViewCell {
    static var reuseIdentifier = "OpeningCrawlDataCell"
    
    var openingText: OpeningCrawlValue?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
        
    // MARK: - Helpers
    
    func update(title: String?, value: OpeningCrawlValue) {
        openingText = value
        titleLabel.text = title
        valueLabel.text = value.formatedValue
    }
}
