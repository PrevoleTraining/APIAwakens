//
//  Vehicle.swift
//  APIAwakens
//
//  Created by lprevost on 24.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class Vehicle: Sizable {
    let name: String
    let model: String
    let manufacturer: String
    let costInCredits: Int
    let lengthInM: Double
    let maxAtmosphericSpeedInKmPerHour: Int
    let crew: Int
    let passengers: Int
    let cargoCapacity: Int
    let consumables: String
    let vhcClass: String // Also for starship class
    let pilots: [String] // Links*/
    
    var size: Double {
        return lengthInM
    }
    
    init(name: String, model: String, manufacturer: String, costInCredits: Int, lengthInM: Double, maxAtmosphericSpeedInKmPerHour: Int, crew: Int, passengers: Int, cargoCapacity: Int, consumables: String, vhcClass: String, pilots: [String]) {
        self.name = name
        self.model = model
        self.manufacturer = manufacturer
        self.costInCredits = costInCredits
        self.lengthInM = lengthInM
        self.maxAtmosphericSpeedInKmPerHour = maxAtmosphericSpeedInKmPerHour
        self.crew = crew
        self.passengers = passengers
        self.cargoCapacity = cargoCapacity
        self.consumables = consumables
        self.vhcClass = vhcClass
        self.pilots = pilots
    }
}
