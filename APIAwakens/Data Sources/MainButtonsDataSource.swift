//
//  MainButtonsDataSource.swift
//  APIAwakens
//
//  Created by lprevost on 11.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation
import UIKit

class MainButtonsDataSource: NSObject, UITableViewDataSource {
    let buttons: [MainButtonData]
    
    init(buttons: [MainButtonData]) {
        self.buttons = buttons
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buttons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MainButtonCell.reuseIdentifier) as? MainButtonCell {
            cell.update(button: buttons[indexPath.row])
            return cell
        } else {
            fatalError("Unknown data cell")
        }
    }
}

struct MainButtonData {
    let title: String?
    let image: UIImage?
    let resource: Resource
    let delegate: MainButtonViewDelegate
}
