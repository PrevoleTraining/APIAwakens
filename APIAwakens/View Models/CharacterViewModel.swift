//
//  CharacterViewModel.swift
//  APIAwakens
//
//  Created by lprevost on 25.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

func characterViewModel(character: SWCharacter) -> ViewModel {
    var data: [ViewModel.LabelValue] = []

    data.append((label: "Born", value: StringValue(value: character.birthYear), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Home", value: ResourceValue(url: character.homeworld, resource: PlanetResource()), cellIdentifier: NamableDataCell.reuseIdentifier))

    if character.species.count == 0 {
        data.append((label: "Species", value: StringValue(value: "unknown"), cellIdentifier: DataCell.reuseIdentifier))
    } else if character.species.count == 1 {
        data.append((label: "Species", value: ResourceValue(url: character.species[0], resource: SpeciesResource()), cellIdentifier: NamableDataCell.reuseIdentifier))
    }
    
    data.append((label: "Height", value: MetricValue(value: character.heightInCm, scale: .centimeter), cellIdentifier: MetricDataCell.reuseIdentifier))
    data.append((label: "Weight", value: MetricValue(value: character.massInKg, scale: .kilogram), cellIdentifier: MetricDataCell.reuseIdentifier))
    data.append((label: "Eyes", value: StringValue(value: character.eyeColor), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Hair", value: StringValue(value: character.hairColor), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Skin", value: StringValue(value: character.skinColor), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Gender", value: StringValue(value: character.gender), cellIdentifier: DataCell.reuseIdentifier))
    data.append(contentsOf: ViewModelFactory.populateCollection(title: "Starships", collection: character.starships, resource: StarshipResource()))
    data.append(contentsOf: ViewModelFactory.populateCollection(title: "Vehicles", collection: character.vehicles, resource: VehicleResource()))
    data.append(contentsOf: ViewModelFactory.populateCollection(title: "Movies", collection: character.movies, resource: MovieResource()))
    
    if character.species.count > 1 {
        data.append(contentsOf: ViewModelFactory.populateCollection(title: "Species", collection: character.species, resource: SpeciesResource()))
    }

    return ViewModel(name: character.name, data: data)
}
