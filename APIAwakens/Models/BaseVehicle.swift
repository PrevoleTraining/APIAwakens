//
//  BaseVehicle.swift
//  APIAwakens
//
//  Created by lprevost on 11.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class BaseVehicle: Sizable, Decodable, CustomStringConvertible {
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case costInCredits = "cost_in_credits"
        case lengthInM = "length"
        case maxAtmosphericSpeedInKmPerHour = "max_atmosphering_speed"
        case crew
        case passengers
        case cargoCapacity = "cargo_capacity"
        case consumables
        case pilots
    }
    
    let name: String
    let model: String
    let manufacturer: String
    let costInCredits: String
    let lengthInM: String
    let maxAtmosphericSpeedInKmPerHour: String
    let crew: String
    let passengers: String
    let cargoCapacity: String
    let consumables: String
    let pilots: [String] // Links*/
    
    var size: Double {
        guard let size = Double(lengthInM) else {
            return -1
        }
        return size
    }
    
    init(name: String, model: String, manufacturer: String, costInCredits: String, lengthInM: String, maxAtmosphericSpeedInKmPerHour: String, crew: String, passengers: String, cargoCapacity: String, consumables: String, pilots: [String]) {
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
        self.pilots = pilots
    }
    
    var description: String {
        return "name=\(name), model=\(model), manufacturer=\(manufacturer), costInCredits=\(costInCredits), lengthInM=\(lengthInM), maxAtmosphericSpeedInKmPerHour=\(maxAtmosphericSpeedInKmPerHour), crew\(crew), passengers=\(passengers), cargoCapacity=\(cargoCapacity), consumables=\(consumables), piltos=[\(pilots.joined(separator: ", "))]"
    }
}
