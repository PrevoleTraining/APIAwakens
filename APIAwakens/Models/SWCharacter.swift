//
//  Character.swift
//  APIAwakens
//
//  Created by lprevost on 24.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class SWCharacter: Classifiable, Decodable, CustomStringConvertible {
    private enum CodingKeys: String, CodingKey {
        case id = "url"
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
        case movies = "films"
        case species
    }
    
    let typeName = "Character"
    let classifierLabel: ClassifiableLabel = .tallestSmallest
    
    let id: String
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
    let movies: [String] // Links
    let species: [String] // Links
    
    var classifierWeight: Double? {
        return heightInCm
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
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
        movies = try container.decode([String].self, forKey: .movies)
        species = try container.decode([String].self, forKey: .species)
    }
    
    var description: String {
        return "id=\(id), name=\(name), heightInCm=\(String(describing: heightInCm)), massInKg=\(String(describing: massInKg)), hairColor=\(hairColor), skinColor=\(skinColor), eyeColor=\(eyeColor), birthYear\(birthYear), gender=\(gender), homeworld=\(homeworld), vehicles=[\(vehicles.joined(separator: ", "))], starships=[\(starships.joined(separator: ", ")), movies=[\(movies.joined(separator: ", ")), species=[\(species.joined(separator: ", "))]"
    }
}
