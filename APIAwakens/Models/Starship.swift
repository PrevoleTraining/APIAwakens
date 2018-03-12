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
    
    let hyperdriveRating: String
    let mglt: String
    let starshipClass: String
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        hyperdriveRating = try container.decode(String.self, forKey: .hyperdriveRating)
        mglt = try container.decode(String.self, forKey: .mglt)
        starshipClass = try container.decode(String.self, forKey: .starshipClass)

        try super.init(from: decoder)
    }
    
    override var description: String {
        return "\(super.description), hyperdriveRating=\(hyperdriveRating), mglt=\(mglt), starshipClass=\(starshipClass)"
    }
}
