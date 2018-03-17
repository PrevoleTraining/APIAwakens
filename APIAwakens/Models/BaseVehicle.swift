//
//  BaseVehicle.swift
//  APIAwakens
//
//  Created by lprevost on 11.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class BaseVehicle: Classifiable, Codable, CustomStringConvertible {
    private enum CodingKeys: String, CodingKey {
        case id = "url"
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
        case movies = "films"
    }
    
    var typeName: String {
        return "Base vehicles"
    }
    
    let classifierLabel: ClassifiableLabel = .longestSmallest
    
    let id: String
    let name: String
    let model: String
    let manufacturer: String
    let costInCredits: Int?
    let lengthInM: Double?
    let maxAtmosphericSpeedInKmPerHour: Double?
    let crew: Int?
    let passengers: Int?
    let cargoCapacity: Int?
    let consumables: String
    let pilots: [String] // Links
    let movies: [String] // Links
    
    var classifierWeight: Double? {
        return lengthInM
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        model = try container.decode(String.self, forKey: .model)
        manufacturer = try container.decode(String.self, forKey: .manufacturer)
        costInCredits = Int(try container.decode(String.self, forKey: .costInCredits))
        lengthInM = Double(try container.decode(String.self, forKey: .lengthInM))
        maxAtmosphericSpeedInKmPerHour = Double(try container.decode(String.self, forKey: .maxAtmosphericSpeedInKmPerHour))
        crew = Int(try container.decode(String.self, forKey: .crew))
        passengers = Int(try container.decode(String.self, forKey: .passengers))
        cargoCapacity = Int(try container.decode(String.self, forKey: .cargoCapacity))
        consumables = try container.decode(String.self, forKey: .consumables)
        pilots = try container.decode([String].self, forKey: .pilots)
        movies = try container.decode([String].self, forKey: .movies)
    }
    
    var description: String {
        return "id=\(id), name=\(name), model=\(model), manufacturer=\(manufacturer), costInCredits=\(String(describing: costInCredits)), lengthInM=\(String(describing: lengthInM)), maxAtmosphericSpeedInKmPerHour=\(String(describing: maxAtmosphericSpeedInKmPerHour)), crew\(String(describing: crew)), passengers=\(String(describing: passengers)), cargoCapacity=\(String(describing: cargoCapacity)), consumables=\(consumables), piltos=[\(pilots.joined(separator: ", ")), movies=[\(movies.joined(separator: ", "))]"
    }
}
