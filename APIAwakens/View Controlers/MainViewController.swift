//
//  ViewController.swift
//  APIAwakens
//
//  Created by lprevost on 24.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    let luke = SWCharacter(name: "Luke Skywalker", heightInCm: 172, massInKg: 77, hairColor: "blond", skinColor: "fair", eyeColor: "blue", birthYear: "19BBY", gender: "male", homeworld: "Tatooine", vehicles: ["https://www.swapi.co/api/vehicles/14/", "https://www.swapi.co/api/vehicles/30/"], starships: ["https://www.swapi.co/api/starships/12/", "https://www.swapi.co/api/starships/22/"])
    
    let c3po = SWCharacter(name: "C-3PO", heightInCm: 167, massInKg: 75, hairColor: "n/a", skinColor: "gold", eyeColor: "yellow", birthYear: "112BBY", gender: "n/a", homeworld: "Tatooine", vehicles: [], starships: [])
    
    lazy var characters: [SWCharacter] = {
        return [ luke, c3po ]
    }()
    
    @IBOutlet weak var charactersButton: UIButton!
    @IBOutlet weak var starhipsButton: UIButton!
    @IBOutlet weak var vehiclesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton(charactersButton)
        setupButton(starhipsButton)
        setupButton(vehiclesButton)
        
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dataView" {
            let controller = segue.destination as! DataViewController
            
            do {
                try controller.data = DataCollection(collectionLabel: "Characters", sizables: characters)
            } catch {
                fatalError()
            }
        }
    }
    
    // Mark: - UI Preparation
    
    func setupButton(_ button: UIButton) {
        button.centerImageAndButton(5, imageOnTop: true)
    }
}

