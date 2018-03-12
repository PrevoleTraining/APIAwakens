//
//  BaseVehicle.swift
//  APIAwakens
//
//  Created by lprevost on 11.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class BaseVehicle: Sizable, Codable, CustomStringConvertible {
    private enum CodingKeys: String, CodingKey {
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
    let costInCredits: Int?
    let lengthInM: Double?
    let maxAtmosphericSpeedInKmPerHour: Int?
    let crew: Int?
    let passengers: Int?
    let cargoCapacity: Int?
    let consumables: String
    let pilots: [String] // Links*/
    
    var size: Double? {
        return lengthInM
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        name = try container.decode(String.self, forKey: .name)
        model = try container.decode(String.self, forKey: .model)
        manufacturer = try container.decode(String.self, forKey: .manufacturer)
        costInCredits = Int(try container.decode(String.self, forKey: .costInCredits))
        lengthInM = Double(try container.decode(String.self, forKey: .lengthInM))
        maxAtmosphericSpeedInKmPerHour = Int(try container.decode(String.self, forKey: .maxAtmosphericSpeedInKmPerHour))
        crew = Int(try container.decode(String.self, forKey: .crew))
        passengers = Int(try container.decode(String.self, forKey: .passengers))
        cargoCapacity = Int(try container.decode(String.self, forKey: .cargoCapacity))
        consumables = try container.decode(String.self, forKey: .consumables)
        pilots = try container.decode([String].self, forKey: .pilots)
    }
    
    var description: String {
        return "name=\(name), model=\(model), manufacturer=\(manufacturer), costInCredits=\(String(describing: costInCredits)), lengthInM=\(String(describing: lengthInM)), maxAtmosphericSpeedInKmPerHour=\(String(describing: maxAtmosphericSpeedInKmPerHour)), crew\(String(describing: crew)), passengers=\(String(describing: passengers)), cargoCapacity=\(String(describing: cargoCapacity)), consumables=\(consumables), piltos=[\(pilots.joined(separator: ", "))]"
    }
}