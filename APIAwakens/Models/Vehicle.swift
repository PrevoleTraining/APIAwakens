//
//  Vehicle.swift
//  APIAwakens
//
//  Created by lprevost on 24.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class Vehicle: BaseVehicle {
    private enum VehicleCodingKeys: String, CodingKey {
        case vhcClass = "vehicle_class"
    }
    
    let vhcClass: String
    
    init(name: String, model: String, manufacturer: String, costInCredits: String, lengthInM: String, maxAtmosphericSpeedInKmPerHour: String, crew: String, passengers: String, cargoCapacity: String, consumables: String, pilots: [String], vhcClass: String) {
        
        self.vhcClass = vhcClass
        
        super.init(name: name, model: model, manufacturer: manufacturer, costInCredits: costInCredits, lengthInM: lengthInM, maxAtmosphericSpeedInKmPerHour: maxAtmosphericSpeedInKmPerHour, crew: crew, passengers: passengers, cargoCapacity: cargoCapacity, consumables: consumables, pilots: pilots)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: VehicleCodingKeys.self)
        
        vhcClass = try container.decode(String.self, forKey: .vhcClass)
        
        try super.init(from: decoder)
    }
    
    override var description: String {
        return "\(super.description), vhcClass=\(vhcClass)"
    }
}
