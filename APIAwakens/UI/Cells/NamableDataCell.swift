//
//  NamableDataCell.swift
//  APIAwakens
//
//  Created by lprevost on 14.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation
import UIKit

class NamableDataCell: UITableViewCell {
    static var reuseIdentifier = "NamableDataCell"
    
    static let normalColor = UIColor(red: 220.0/255.0, green: 220.0/255.0, blue: 220.0/255.0, alpha: 1.0)
    static let errorColor = UIColor.red
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var resource: Resource?
    
    // MARK: - Helpers
    
    func update(label: String, data: ResourceValue) {
        self.spinner.startAnimating()
        self.valueLabel.isHidden = true

        titleLabel.text = label
        self.resource = data.resource
        
        spinner.startAnimating()
        
        resource!.getOne(url: data.url) { (entity, error) in
            if let entity = entity {
                self.valueLabel.text = entity.name
                self.valueLabel.textColor = NamableDataCell.normalColor
            } else {
                self.valueLabel.text = "Network Error!"
                self.valueLabel.textColor = NamableDataCell.errorColor
            }

            self.spinner.stopAnimating()
            self.valueLabel.isHidden = false
        }
    }
}
