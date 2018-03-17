//
//  Movie.swift
//  APIAwakens
//
//  Created by lprevost on 17.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class Movie: Classifiable, Decodable, CustomStringConvertible {
    private enum CodingKeys: String, CodingKey {
        case id = "url"
        case name = "title"
        case episode = "episode_id"
        case director
        case producer
        case opening = "opening_crawl"
        case releaseDate = "release_date"
        case species
        case starships
        case vehicles
        case characters
        case planets
    }
    
    let typeName = "Planet"
    let classifierLabel: ClassifiableLabel = .oldestLatest
    
    let id: String
    let name: String
    let episode: Int
    let director: String
    let producer: String
    let opening: String
    let releaseDate: String
    let species: [String]
    let starships: [String]
    let vehicles: [String]
    let characters: [String]
    let planets: [String]
    
    private let isoFormater: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = .withFullDate
        return formatter
    }()
    
    var classifierWeight: Double? {
        if let date = isoFormater.date(from: releaseDate) {
            return Double(date.timeIntervalSince1970)
        } else {
            return nil
        }
    }
    
    required init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
        
            id = try container.decode(String.self, forKey: .id)
            name = try container.decode(String.self, forKey: .name)
            episode = try container.decode(Int.self, forKey: .episode)
            director = try container.decode(String.self, forKey: .director)
            producer = try container.decode(String.self, forKey: .producer)
            opening = try container.decode(String.self, forKey: .opening)
            releaseDate = try container.decode(String.self, forKey: .releaseDate)
            species = try container.decode([String].self, forKey: .species)
            starships = try container.decode([String].self, forKey: .starships)
            vehicles = try container.decode([String].self, forKey: .vehicles)
            characters = try container.decode([String].self, forKey: .characters)
            planets = try container.decode([String].self, forKey: .planets)
        } catch {
            fatalError()
        }
    }
    
    var description: String {
        return "id=\(id), name=\(name), episode=\(episode), director=\(director), producer=\(producer), opening=\(opening), releaseDate=\(releaseDate)), species\(species.joined(separator: ", ")), starships=\(starships.joined(separator: ", ")), vehicles=\(vehicles.joined(separator: ", ")), characters=\(characters.joined(separator: ", ")), planets=\(planets.joined(separator: ", "))]"
    }
}
