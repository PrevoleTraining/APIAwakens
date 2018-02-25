//
//  Character.swift
//  APIAwakens
//
//  Created by lprevost on 24.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class SWCharacter {
    let name: String
    let heightInCm: Double
    let massInKg: Double
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    let homeworld: String // Link
    let vehicles: [String] // Links
    let starships: [String] // Links
    
    init(name: String, heightInCm: Double, massInKg: Double, hairColor: String, skinColor: String, eyeColor: String, birthYear: String, gender: String, homeworld: String, vehicles: [String], starships: [String]) {
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
