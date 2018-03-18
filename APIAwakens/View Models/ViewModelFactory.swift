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
        case let character as SWCharacter: return characterViewModel(character: character)
        case let starship as Starship: return starshipViewModel(starship: starship)
        case let vehicle as Vehicle: return vehicleViewModel(vehicle: vehicle)
        case let planet as Planet: return planetViewModel(planet: planet)
        case let movie as Movie: return movieViewModel(movie: movie)
        case let species as Species: return speciesViewModel(species: species)
        default: fatalError("Should never hapened")
        }
    }
    
    static func populateCollection(title: String, collection: [String], resource: Resource) -> [ViewModel.LabelValue] {
        var data: [ViewModel.LabelValue] = []
        
        if collection.count > 0 {
            data.append((label: title, value: StringValue(value: ""), cellIdentifier: TitleCell.reuseIdentifier))
            
            for item in collection {
                data.append((label: nil, value: ResourceValue(url: item, resource: resource), cellIdentifier: NamableDataCell.reuseIdentifier))
            }
        }
        
        return data
    }
}
