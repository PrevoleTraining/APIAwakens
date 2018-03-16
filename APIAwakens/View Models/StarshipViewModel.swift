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
    data.append((label: "Crew", value: IntValue(value: starship.crew), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Passengers", value: IntValue(value: starship.passengers), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Cargo", value: IntValue(value: starship.cargoCapacity), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Consumables", value: StringValue(value: starship.consumables), cellIdentifier: DataCell.reuseIdentifier))

    if starship.pilots.count > 0 {
        data.append((label: "Pilots", value: StringValue(value: ""), cellIdentifier: TitleCell.reuseIdentifier))
        
        for pilot in starship.pilots {
            data.append((label: nil, value: ResourceValue(url: pilot, resource: SWCharacterResource()), cellIdentifier: NamableDataCell.reuseIdentifier))
        }
    }
    
    return ViewModel(name: starship.name, data: data)
}
