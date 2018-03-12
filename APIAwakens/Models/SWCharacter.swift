//
//  Character.swift
//  APIAwakens
//
//  Created by lprevost on 24.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class SWCharacter: Sizable, Decodable, CustomStringConvertible {
    private enum CodingKeys: String, CodingKey {
        case name
        case heightInCm = "height"
        case massInKg = "mass"
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender
        case homeworld
        case vehicles
        case starships
    }
    
    let name: String
    let heightInCm: Double?
    let massInKg: Double?
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    let homeworld: String // Link
    let vehicles: [String] // Links
    let starships: [String] // Links
    
    var size: Double? {
        return heightInCm
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        heightInCm = Double(try container.decode(String.self, forKey: .heightInCm))
        massInKg = Double(try container.decode(String.self, forKey: .massInKg))
        hairColor = try container.decode(String.self, forKey: .hairColor)
        skinColor = try container.decode(String.self, forKey: .skinColor)
        eyeColor = try container.decode(String.self, forKey: .eyeColor)
        birthYear = try container.decode(String.self, forKey: .birthYear)
        gender = try container.decode(String.self, forKey: .gender)
        homeworld = try container.decode(String.self, forKey: .homeworld)
        vehicles = try container.decode([String].self, forKey: .vehicles)
        starships = try container.decode([String].self, forKey: .starships)
    }
    
    var description: String {
        return "name=\(name), heightInCm=\(String(describing: heightInCm)), massInKg=\(String(describing: massInKg)), hairColor=\(hairColor), skinColor=\(skinColor), eyeColor=\(eyeColor), birthYear\(birthYear), gender=\(gender), homeworld=\(homeworld), vehicles=[\(vehicles.joined(separator: ", "))], starships=[\(starships.joined(separator: ", "))]"
    }
}
