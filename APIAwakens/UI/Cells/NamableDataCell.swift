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
    static let titleLabelMinWidth = CGFloat(110)
    static let labelsSpacing = CGFloat(10)
    
    static var reuseIdentifier = "NamableDataCell"
    
    static let normalColor = UIColor(red: 220.0/255.0, green: 220.0/255.0, blue: 220.0/255.0, alpha: 1.0)
    static let errorColor = UIColor.red
    
    var error: SWAPIError?
    var entity: Namable? {
        didSet {
            if let entity = entity {
                accessoryType = .disclosureIndicator
                isUserInteractionEnabled = true
                valueLabel.text = entity.name
                valueLabel.textColor = NamableDataCell.normalColor
            } else {
                accessoryType = .none
                isUserInteractionEnabled = false
                if let error = error {
                    valueLabel.text = error.friendlyMessage
                    valueLabel.textColor = NamableDataCell.errorColor
                } else {
                    valueLabel.text = "n/a"
                    valueLabel.textColor = NamableDataCell.normalColor
                }
            }
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var titleLabelWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelsSpacingConstraint: NSLayoutConstraint!
    
    var value: ResourceValue?
    
    // MARK: - Actions
    
    @IBAction func details(_ sender: Any) {
    }
    
    // MARK: - Helpers
    
    func update(label: String?, data: ResourceValue) {
        self.spinner.startAnimating()
        self.valueLabel.isHidden = true

        self.value = data
        
        manageTitle(label: label)
        updateFromResource()
    }
    
    private func manageTitle(label: String?) {
        if let label = label {
            titleLabel.text = label
            titleLabel.isHidden = false
            titleLabelWidthConstraint.constant = NamableDataCell.titleLabelMinWidth
            labelsSpacingConstraint.constant = NamableDataCell.labelsSpacing
        } else {
            titleLabel.text = ""
            titleLabel.isHidden = true
            titleLabelWidthConstraint.constant = 0
            labelsSpacingConstraint.constant = 0
        }
    }
    
    private func updateFromResource() {
        guard let value = value else {
            return
        }
        
        spinner.startAnimating()
        
        if let url = value.url {
            value.resource.getOne(url: url) { (entity, error) in
                self.entity = entity
                self.error = error
                self.spinner.stopAnimating()
                self.valueLabel.isHidden = false
            }
        } else {
            self.entity = nil
            self.spinner.stopAnimating()
            self.valueLabel.isHidden = false
        }
    }
}
