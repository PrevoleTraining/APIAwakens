//
//  ViewModelFactory.swift
//  APIAwakens
//
//  Created by lprevost on 03.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class ViewModelFactory {
    static func create(namable: Namable) -> ViewModel {
        switch namable {
        case let namable as SWCharacter: return characterViewModel(character: namable)
        case let namable as Starship: return starshipViewModel(starship: namable)
        case let namable as Vehicle: return vehicleViewModel(vehicle: namable)
        case let namable as Planet: return planetViewModel(planet: namable)
        default: fatalError("Should never hapened")
        }
    }
}
