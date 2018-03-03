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
    
    let landspeeder = Vehicle(name: "Landspeeder", model: "t-47 airspeeder", manufacturer: "Incom corporation", costInCredits: -1, lengthInM: 4.5, maxAtmosphericSpeedInKmPerHour: 650, crew: 2, passengers: 0, cargoCapacity: 10, consumables: "none", vhcClass: "airspeeder", pilots: ["https://www.swapi.co/api/people/1/", "https://www.swapi.co/api/people/18/"])
    
    let speederBike = Vehicle(name: "Imperial Speeder Bike", model: "74-Z speeder bike", manufacturer: "Aratech Repulsor Company", costInCredits: 8000, lengthInM: 3, maxAtmosphericSpeedInKmPerHour: 360, crew: 1, passengers: 1, cargoCapacity: 4, consumables: "1 day", vhcClass: "speeder", pilots: ["https://www.swapi.co/api/people/1/", "https://www.swapi.co/api/people/5/"])
    
    let deathStar = Starship(name: "Death Star", model: "DS-1 Orbital Battle Station", manufacturer: "Imperial Department of Military Research, Sienar Fleet Systems", costInCredits: 1000000000000, lengthInM: 120000, maxAtmosphericSpeedInKmPerHour: -1, crew: 342953, passengers: 843342, cargoCapacity: 1000000000000, consumables: "3 years", vhcClass: "Deep Space Mobile Battlestation", pilots: [], hyperdriveRating: 4.0, mglt: 10)
    
    let corelianCorvette = Starship(name: "CR90 corvette", model: "CR90 corvette", manufacturer: "Corellian Engineering Corporation", costInCredits: 3500000, lengthInM: 150, maxAtmosphericSpeedInKmPerHour: 950, crew: 165, passengers: 600, cargoCapacity: 3000000, consumables: "1 year", vhcClass: "corvette", pilots: [], hyperdriveRating: 2.0, mglt: 60)
    
    lazy var characters: [SWCharacter] = {
        return [ luke, c3po ]
    }()
    
    lazy var vehicles: [Vehicle] = {
        return [ landspeeder, speederBike ]
    }()
    
    lazy var starships: [Starship] = {
        return [ deathStar, corelianCorvette ]
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
        if let controller = segue.destination as? DataViewController, let identifier = segue.identifier {
            switch identifier {
            case "charactersDetailsView": prepare(controller: controller, sizables: characters, label: "Characters")
            case "vehiclesDetailsView": prepare(controller: controller, sizables: vehicles, label: "Vehicles")
            case "starshipsDetailsView": prepare(controller: controller, sizables: starships, label: "Starships")
            default: fatalError()
            }
        }
    }
    
    // Mark: - UI Preparation
    
    func setupButton(_ button: UIButton) {
        button.centerImageAndButton(5, imageOnTop: true)
    }
    
    // Mark: - Helpers
    func prepare(controller: DataViewController, sizables: [Sizable], label: String) {
        do {
            try controller.data = DataCollection(collectionLabel: label, sizables: sizables)
        } catch {
            fatalError()
        }
    }
}

