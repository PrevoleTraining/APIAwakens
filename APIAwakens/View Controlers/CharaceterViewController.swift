//
//  CharaceterViewController.swift
//  APIAwakens
//
//  Created by lprevost on 25.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import UIKit

class CharaceterViewController: UITableViewController {
    let character = SWCharacter(name: "Luke Skywalker", heightInCm: 1.72, massInKg: 77, hairColor: "blond", skinColor: "fair", eyeColor: "blue", birthYear: "19BBY", gender: "male", homeworld: "https://www.swapi.co/api/planets/1/", vehicles: ["https://www.swapi.co/api/vehicles/14/", "https://www.swapi.co/api/vehicles/30/"], starships: ["https://www.swapi.co/api/starships/12/", "https://www.swapi.co/api/starships/22/"])
    
    let characterDetailDataSource = CharacterDetailsDataSource()
    
    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = character.name
        
        characterDetailDataSource.update(with: character)
        
        tableView.dataSource = characterDetailDataSource
    }
    
    override func viewDidLayoutSubviews() {
        tableView.adjustFooterViewHeightToFillTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


