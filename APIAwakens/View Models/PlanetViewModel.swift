//
//  PlanetViewModel.swift
//  APIAwakens
//
//  Created by lprevost on 16.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

func planetViewModel(planet: Planet) -> ViewModel {
    var data: [ViewModel.LabelValue] = []
    
    data.append((label: "Climate", value: StringValue(value: planet.climate), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Terrain", value: StringValue(value: planet.terrain), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Water", value: PercentValue(valueInPerCent: planet.surfaceWaterInPerCent), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Population", value: NumberValue(value: planet.population), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Gravity", value: StringValue(value: planet.gravity), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Diameter", value: MetricValue(value: planet.diameterInKm, scale: .kilometer), cellIdentifier: MetricDataCell.reuseIdentifier))
    data.append((label: "Rotation", value: NumberValue(value: planet.rotationPeriodInHours, suffix: " hours"), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Orbit", value: NumberValue(value: planet.orbitalPeriodInDays, suffix: " days"), cellIdentifier: DataCell.reuseIdentifier))
    data.append(contentsOf: ViewModelFactory.populateCollection(title: "Residents", collection: planet.residents, resource: SWCharacterResource()))
    data.append(contentsOf: ViewModelFactory.populateCollection(title: "Movies", collection: planet.movies, resource: MovieResource()))

    return ViewModel(name: planet.name, data: data)
}
