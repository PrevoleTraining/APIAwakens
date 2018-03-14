//
//  Planet.swift
//  APIAwakens
//
//  Created by lprevost on 13.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class Planet: Sizable, Decodable, CustomStringConvertible {
    private enum CodingKeys: String, CodingKey {
        case id = "url"
        case name
        case diameterInKm = "diameter"
        case rotationPeriodInHours = "rotation_period"
        case orbitalPeriodInDays = "orbital_period"
        case gravity
        case population
        case climate
        case terrain
        case surfaceWaterInPerCent = "surface_water"
        case residents
    }
    
    let id: String
    let name: String
    let diameterInKm: Int?
    let rotationPeriodInHours: Int?
    let orbitalPeriodInDays: Int?
    let gravity: Double?
    let population: Int?
    let climate: String
    let terrain: String
    let surfaceWaterInPerCent: Int?
    let residents: [String]
    
    var size: Double? {
        if let diameterInKm = diameterInKm {
            return Double(diameterInKm)
        } else {
            return nil
        }
    }
    
    required init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
        
            id = try container.decode(String.self, forKey: .id)
            name = try container.decode(String.self, forKey: .name)
            diameterInKm = Int(try container.decode(String.self, forKey: .diameterInKm))
            rotationPeriodInHours = Int(try container.decode(String.self, forKey: .rotationPeriodInHours))
            orbitalPeriodInDays = Int(try container.decode(String.self, forKey: .orbitalPeriodInDays))
            gravity = Double(try container.decode(String.self, forKey: .gravity))
            population = Int(try container.decode(String.self, forKey: .population))
            climate = try container.decode(String.self, forKey: .climate)
            terrain = try container.decode(String.self, forKey: .terrain)
            surfaceWaterInPerCent = Int(try container.decode(String.self, forKey: .surfaceWaterInPerCent))
            residents = try container.decode([String].self, forKey: .residents)
        } catch {
            fatalError()
        }
    }
    
    var description: String {
        return "id=\(id), name=\(name), diametersInKm=\(String(describing: diameterInKm)), rotationPeriodInHours=\(String(describing: rotationPeriodInHours)), orbitalPeriodInDays=\(String(describing: orbitalPeriodInDays)), gravity=\(String(describing: gravity)), population=\(String(describing: population)), cliamte\(climate), terrain=\(terrain), surfaceWaterInPerCent=\(String(describing: surfaceWaterInPerCent)), residents=\(residents.joined(separator: ", "))]"
    }
}
