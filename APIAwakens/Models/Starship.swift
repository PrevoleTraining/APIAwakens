//
//  Starship.swift
//  APIAwakens
//
//  Created by lprevost on 24.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class Starship: BaseVehicle {
    private enum CodingKeys: String, CodingKey {
        case hyperdriveRating = "hyperdrive_rating"
        case mglt = "MGLT"
        case starshipClass = "starship_class"
    }
    
    override var typeName: String {
        return "Starship"
    }
    
    let hyperdriveRating: String
    let mglt: Double?
    let starshipClass: String
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        hyperdriveRating = try container.decode(String.self, forKey: .hyperdriveRating)
        mglt = Double(try container.decode(String.self, forKey: .mglt))
        starshipClass = try container.decode(String.self, forKey: .starshipClass)

        try super.init(from: decoder)
    }
    
    override var description: String {
        return "\(super.description), hyperdriveRating=\(hyperdriveRating), mglt=\(String(describing: mglt)), starshipClass=\(starshipClass)"
    }
}
