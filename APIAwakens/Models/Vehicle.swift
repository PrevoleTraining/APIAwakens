//
//  Vehicle.swift
//  APIAwakens
//
//  Created by lprevost on 24.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class Vehicle: BaseVehicle {
    private enum CodingKeys: String, CodingKey {
        case vhcClass = "vehicle_class"
    }
    
    override var typeName: String {
        return "Vehicle"
    }

    let vhcClass: String
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        vhcClass = try container.decode(String.self, forKey: .vhcClass)
        
        try super.init(from: decoder)
    }
    
    override var description: String {
        return "\(super.description), vhcClass=\(vhcClass)"
    }
}
