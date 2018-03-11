//
//  MainButtonCell.swift
//  APIAwakens
//
//  Created by lprevost on 11.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation
import UIKit

class MainButtonCell: UITableViewCell {
    static var reuseIdentifier = "MainButtonCell"
    
    @IBOutlet weak var mainButtonView: MainButtonView!
    
    func update(button: MainButtonData) {
        mainButtonView.label = button.title
        mainButtonView.image = button.image
        mainButtonView.resource = button.resource
        mainButtonView.delegate = button.delegate
    }
}
