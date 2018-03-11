//
//  Character.swift
//  APIAwakens
//
//  Created by lprevost on 24.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class SWCharacter: Sizable, Decodable, CustomStringConvertible {
    enum CodingKeys: String, CodingKey {
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
    let heightInCm: String
    let massInKg: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    let homeworld: String // Link
    let vehicles: [String] // Links
    let starships: [String] // Links
    
    var size: Double {
        guard let size = Double(heightInCm) else {
            return -1
        }
        return size
    }
    
    var description: String {
        return "name=\(name), heightInCm=\(heightInCm), massInKg=\(massInKg), hairColor=\(hairColor), skinColor=\(skinColor), eyeColor=\(eyeColor), birthYear\(birthYear), gender=\(gender), homeworld=\(homeworld), vehicles=[\(vehicles.joined(separator: ", "))], starships=[\(starships.joined(separator: ", "))]"
    }
    
    init(name: String, heightInCm: String, massInKg: String, hairColor: String, skinColor: String, eyeColor: String, birthYear: String, gender: String, homeworld: String, vehicles: [String], starships: [String]) {
        self.name = name
        self.heightInCm = heightInCm
        self.massInKg = massInKg
        self.hairColor = hairColor
        self.skinColor = skinColor
        self.eyeColor = eyeColor
        self.birthYear = birthYear
        self.gender = gender
        self.homeworld = homeworld
        self.vehicles = vehicles
        self.starships = starships
    }
}
