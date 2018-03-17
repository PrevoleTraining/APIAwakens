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
        case let namable as Movie: return movieViewModel(movie: namable)
        case let namable as Species: return speciesViewModel(species: namable)
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
