//
//  CharaceterViewController.swift
//  APIAwakens
//
//  Created by lprevost on 25.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import UIKit

class CharaceterViewController: UITableViewController, UIPickerViewDelegate {
    var characters: [SWCharacter]? {
        didSet {
            if let characters = characters {
                characterPickerDS.update(characters: characters)
            }
        }
    }
    
    private let characterPickerDS = CharactersPickerDataSource()
    
    private let characterDetailDataSource = CharacterDetailsDataSource()
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var characterPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = characterDetailDataSource
        characterPicker.dataSource = characterPickerDS
        characterPicker.delegate = characterPickerDS
        
        characterPickerDS.observe { character in
            self.nameLabel.text = character.name
            self.characterDetailDataSource.update(with: character)
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLayoutSubviews() {
        tableView.adjustFooterViewHeightToFillTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


