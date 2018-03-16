//
//  VehicleViewModel.swift
//  APIAwakens
//
//  Created by lprevost on 03.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

func vehicleViewModel(vehicle: Vehicle) -> ViewModel {
    var data: [ViewModel.LabelValue] = []
    
    data.append((label: "Make", value: StringValue(value: vehicle.manufacturer), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Model", value: StringValue(value: vehicle.model), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Class", value: StringValue(value: vehicle.vhcClass), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Cost", value: CashValue(valueInCredits: vehicle.costInCredits), cellIdentifier: CashDataCell.reuseIdentifier))
    data.append((label: "Length", value: MetricValue(value: vehicle.lengthInM, scale: .meter), cellIdentifier: MetricDataCell.reuseIdentifier))
    data.append((label: "Speed", value: MetricValue(value: vehicle.maxAtmosphericSpeedInKmPerHour, scale: .kilometersPerHour), cellIdentifier: MetricDataCell.reuseIdentifier))
    data.append((label: "Crew", value: IntValue(value: vehicle.crew), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Passengers", value: IntValue(value: vehicle.passengers), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Cargo", value: IntValue(value: vehicle.cargoCapacity), cellIdentifier: DataCell.reuseIdentifier))
    data.append((label: "Consumables", value: StringValue(value: vehicle.consumables), cellIdentifier: DataCell.reuseIdentifier))

    if vehicle.pilots.count > 0 {
        data.append((label: "Pilots", value: StringValue(value: ""), cellIdentifier: TitleCell.reuseIdentifier))
        
        for pilot in vehicle.pilots {
            data.append((label: nil, value: ResourceValue(url: pilot, resource: SWCharacterResource()), cellIdentifier: NamableDataCell.reuseIdentifier))
        }
    }
    
    return ViewModel(name: vehicle.name, data: data)
}
