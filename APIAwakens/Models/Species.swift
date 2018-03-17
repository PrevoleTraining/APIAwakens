//
//  Species.swift
//  APIAwakens
//
//  Created by lprevost on 17.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class Species: Classifiable, Decodable, CustomStringConvertible {
    private enum CodingKeys: String, CodingKey {
        case id = "url"
        case name
        case classification
        case designation
        case averageHeight = "average_height"
        case averageLifespan = "average_lifespan"
        case eyesColors = "eye_colors"
        case hairColors = "hair_colors"
        case skinColors = "skin_colors"
        case language
        case homeworld
        case characters = "people"
        case movies = "films"
    }
    
    let typeName = "Species"
    let classifierLabel: ClassifiableLabel = .oldestLatest
    
    let id: String
    let name: String
    let classification: String
    let designation: String
    let averageHeight: Double?
    let averageLifespan: Double?
    let eyesColors: String
    let hairColors: String
    let skinColors: String
    let language: String
    let homeworld: String? // Link
    let characters: [String] // Links
    let movies: [String] // Links
    
    var classifierWeight: Double? {
        return averageHeight
    }
    
    required init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            id = try container.decode(String.self, forKey: .id)
            name = try container.decode(String.self, forKey: .name)
            classification = try container.decode(String.self, forKey: .classification)
            designation = try container.decode(String.self, forKey: .designation)
            averageHeight = Double(try container.decode(String.self, forKey: .averageHeight))
            averageLifespan = Double(try container.decode(String.self, forKey: .averageLifespan))
            eyesColors = try container.decode(String.self, forKey: .eyesColors)
            hairColors = try container.decode(String.self, forKey: .hairColors)
            skinColors = try container.decode(String.self, forKey: .skinColors)
            language = try container.decode(String.self, forKey: .language)
            homeworld = try container.decodeIfPresent(String.self, forKey: .homeworld)
            characters = try container.decode([String].self, forKey: .characters)
            movies = try container.decode([String].self, forKey: .movies)
        } catch {
            fatalError()
        }
    }
    
    var description: String {
        return "id=\(id), name=\(name), classification=\(classification), designation=\(designation), averageHeight=\(String(describing: averageHeight)), averageLifespan=\(String(describing: averageLifespan)), eyesColors=\(eyesColors)), hairColors\(hairColors), skinColors=\(skinColors), language=\(language), homeworld=\(String(describing: homeworld)), characters=\(characters.joined(separator: ", ")), movies=\(movies.joined(separator: ", "))]"
    }
}
