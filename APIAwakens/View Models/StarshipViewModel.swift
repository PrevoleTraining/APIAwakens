//
//  StarshipViewModel.swift
//  APIAwakens
//
//  Created by lprevost on 03.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

func starshipViewModel(starship: Starship) -> ViewModel {
    var data: [ViewModel.LabelValue] = []
    
    data.append((label: "Make", value: StringValue(value: starship.manufacturer), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Model", value: StringValue(value: starship.model), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Class", value: StringValue(value: starship.starshipClass), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Cost", value: CashValue(valueInCredits: starship.costInCredits), cellIdentifier: CashDataCell.reuseIdentifier))
    data.append((label: "Length", value: MetricValue(value: starship.lengthInM, scale: .meter), cellIdentifier: MetricDataCell.reuseIdentifier))
    data.append((label: "Speed", value: MetricValue(value: starship.maxAtmosphericSpeedInKmPerHour, scale: .kilometersPerHour), cellIdentifier: MetricDataCell.reuseIdentifier))
    data.append((label: "Space speed", value: NumberValue(value: starship.mglt, suffix: " mglt"), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Hyperdrive", value: StringValue(value: starship.hyperdriveRating), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Crew", value: NumberValue(value: starship.crew), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Passengers", value: NumberValue(value: starship.passengers), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Cargo", value: NumberValue(value: starship.cargoCapacity), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Consumables", value: StringValue(value: starship.consumables), cellIdentifier: DataCell.reuseIdentifier))
    data.append(contentsOf: ViewModelFactory.populateCollection(title: "Pilots", collection: starship.pilots, resource: SWCharacterResource()))
    data.append(contentsOf: ViewModelFactory.populateCollection(title: "Movies", collection: starship.movies, resource: MovieResource()))

    return ViewModel(name: starship.name, data: data)
}
