//
//  Starship.swift
//  APIAwakens
//
//  Created by lprevost on 24.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class Starship: BaseVehicle {
    private enum StarshipCodingKeys: String, CodingKey {
        case hyperdriveRating = "hyperdrive_rating"
        case mglt = "MGLT"
        case starshipClass = "starship_class"
    }
    
    let hyperdriveRating: String
    let mglt: String
    let starshipClass: String
    
    init(name: String, model: String, manufacturer: String, costInCredits: String, lengthInM: String, maxAtmosphericSpeedInKmPerHour: String, crew: String, passengers: String, cargoCapacity: String, consumables: String, pilots: [String], hyperdriveRating: String, mglt: String, starshipClass: String) {
        self.hyperdriveRating = hyperdriveRating
        self.mglt = mglt
        self.starshipClass = starshipClass

        super.init(name: name, model: model, manufacturer: manufacturer, costInCredits: costInCredits, lengthInM: lengthInM, maxAtmosphericSpeedInKmPerHour: maxAtmosphericSpeedInKmPerHour, crew: crew, passengers: passengers, cargoCapacity: cargoCapacity, consumables: consumables, pilots: pilots)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StarshipCodingKeys.self)
        
        hyperdriveRating = try container.decode(String.self, forKey: .hyperdriveRating)
        mglt = try container.decode(String.self, forKey: .mglt)
        starshipClass = try container.decode(String.self, forKey: .starshipClass)

        try super.init(from: decoder)
    }
    
    override var description: String {
        return "\(super.description), hyperdriveRating=\(hyperdriveRating), mglt=\(mglt), starshipClass=\(starshipClass)"
    }
}
