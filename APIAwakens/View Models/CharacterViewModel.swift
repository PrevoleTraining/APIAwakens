//
//  CharacterViewModel.swift
//  APIAwakens
//
//  Created by lprevost on 25.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

struct CharacterViewModel: ViewModel {
    let name: String
    let data: [LabelValue]
}

extension CharacterViewModel {
    init(character: SWCharacter) {
        self.name = character.name
        
        var data: [LabelValue] = []
    
        data.append((label: "Born", value: StringValue(value: character.birthYear), cellIdentifier: DataCell.reuseIdentifier))
        data.append((label: "Home", value: ResourceValue(url: character.homeworld, resource: PlanetResource()), cellIdentifier: NamableDataCell.reuseIdentifier))
        data.append((label: "Height", value: MetricValue(valueInCm: character.size), cellIdentifier: MetricDataCell.reuseIdentifier))
        data.append((label: "Eyes", value: StringValue(value: character.eyeColor), cellIdentifier: DataCell.reuseIdentifier))
        data.append((label: "Hair", value: StringValue(value: character.hairColor), cellIdentifier: DataCell.reuseIdentifier))
        
        if character.starships.count > 0 {
            data.append((label: "Starships", value: StringValue(value: ""), cellIdentifier: TitleCell.reuseIdentifier))
            
            for starship in character.starships {
                data.append((label: "", value: ResourceValue(url: starship, resource: StarshipResource()), cellIdentifier: NamableDataCell.reuseIdentifier))
            }
        }

        if character.vehicles.count > 0 {
            data.append((label: "Vehicles", value: StringValue(value: ""), cellIdentifier: TitleCell.reuseIdentifier))
            
            for vehicle in character.vehicles {
                data.append((label: "", value: ResourceValue(url: vehicle, resource: VehicleResource()), cellIdentifier: NamableDataCell.reuseIdentifier))
            }
        }
        
        self.data = data;
    }
}
