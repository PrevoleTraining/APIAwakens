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
                self.spinner.stopAnimating()
                self.valueLabel.isHidden = false
            } else {
                print(error!)
            }
        }
    }
}
