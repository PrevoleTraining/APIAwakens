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
        let cell = tableView.dequeueReusableCell(withIdentifier: DataCell.reuseIdentifier, for: indexPath) as! DataCell
        
        if let character = character {
            let data = character.data[indexPath.row]
            
            cell.titleLabel.text = data.label.rawValue
            cell.valueLabel.text = data.value.formatedValue
        } else {
            cell.titleLabel.text = ""
            cell.valueLabel.text = ""
        }
        
        return cell
    }
    
    func update(with character: SWCharacter) {
        self.character = CharacterViewModel(character: character)
    }
}
