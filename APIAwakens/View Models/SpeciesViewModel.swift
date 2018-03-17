//
//  SpeciesViewModel.swift
//  APIAwakens
//
//  Created by lprevost on 17.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

func speciesViewModel(species: Species) -> ViewModel {
    var data: [ViewModel.LabelValue] = []
    
    data.append((label: "Class", value: StringValue(value: species.classification), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Designation", value: StringValue(value: species.designation), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Homeworld", value: ResourceValue(url: species.homeworld, resource: PlanetResource()), cellIdentifier: NamableDataCell.reuseIdentifier))
    data.append((label: "Languate", value: StringValue(value: species.language), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Avg. Height", value: MetricValue(value: species.averageHeight, scale: .centimeter), cellIdentifier: MetricDataCell.reuseIdentifier))
    data.append((label: "Avg. Life", value: NumberValue(value: species.averageLifespan, suffix: " years"), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Eyes", value: StringValue(value: species.eyesColors), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Hair", value: StringValue(value: species.hairColors), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Skins", value: StringValue(value: species.skinColors), cellIdentifier: DataCell.reuseIdentifier))
    data.append(contentsOf: ViewModelFactory.populateCollection(title: "Characters", collection: species.characters, resource: SWCharacterResource()))
    data.append(contentsOf: ViewModelFactory.populateCollection(title: "Movies", collection: species.movies, resource: MovieResource()))
    
    return ViewModel(name: species.name, data: data)
}
