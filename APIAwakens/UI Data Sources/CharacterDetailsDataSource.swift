//
//  CharacterDetailDataSource.swift
//  APIAwakens
//
//  Created by lprevost on 25.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation
import UIKit

class CharacterDetailsDataSource: NSObject, UITableViewDataSource {
    private var character: CharacterViewModel?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let character = character else {
            return 0
        }
        
        return character.data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let character = character {
            let data = character.data[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: data.cellIdentifier)
            
            if let dataCell = cell as? DataCell {
                dataCell.update(label: data.label.rawValue, data: data.value)
            } else if let toggleDataCell = cell as? ToggleDataCell {
                toggleDataCell.update(label: data.label.rawValue, data: data.value as! DataValueToggelable)
            }
            
//            let cell = tableView.dequeueReusableCell(withIdentifier: data.cellIdentifier, for: indexPath) as! DataCell
//
//            cell.update(label: data.label.rawValue, data: data.value)
            
            return cell!
        } else {
            return tableView.dequeueReusableCell(withIdentifier: DataCell.reuseIdentifier, for: indexPath)
        }
    }
    
    func update(with character: SWCharacter) {
        self.character = CharacterViewModel(character: character)
    }
}
