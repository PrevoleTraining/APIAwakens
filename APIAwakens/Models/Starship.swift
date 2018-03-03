//
//  Starship.swift
//  APIAwakens
//
//  Created by lprevost on 24.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class Starship: Vehicle {
    let hyperdriveRating: Double
    let mglt: Int
    
    init(name: String, model: String, manufacturer: String, costInCredits: Int, lengthInM: Double, maxAtmosphericSpeedInKmPerHour: Int, crew: Int, passengers: Int, cargoCapacity: Int, consumables: String, vhcClass: String, pilots: [String], hyperdriveRating: Double, mglt: Int) {
        self.hyperdriveRating = hyperdriveRating
        self.mglt = mglt

        super.init(name: name, model: model, manufacturer: manufacturer, costInCredits: costInCredits, lengthInM: lengthInM, maxAtmosphericSpeedInKmPerHour: maxAtmosphericSpeedInKmPerHour, crew: crew, passengers: passengers, cargoCapacity: cargoCapacity, consumables: consumables, vhcClass: vhcClass, pilots: pilots)
}
}
