//
//  VehicleViewModel.swift
//  APIAwakens
//
//  Created by lprevost on 03.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

struct VehicleViewModel: ViewModel {
    let name: String
    let data: [LabelValue]
}

extension VehicleViewModel {
    init(vehicle: Vehicle) {
        self.name = vehicle.name
        
        var data: [LabelValue] = []
        
        data.append((label: "Make", value: StringValue(value: vehicle.manufacturer), cellIdentifier: DataCell.reuseIdentifier))
        data.append((label: "Cost", value: CashValue(valueInCredits: vehicle.costInCredits), cellIdentifier: CashDataCell.reuseIdentifier))
        data.append((label: "Length", value: MetricValue(valueInM: vehicle.size), cellIdentifier: MetricDataCell.reuseIdentifier))
        data.append((label: "Class", value: StringValue(value: vehicle.vhcClass), cellIdentifier: DataCell.reuseIdentifier))
        data.append((label: "Crew", value: IntValue(value: vehicle.crew), cellIdentifier: DataCell.reuseIdentifier))
        
        if vehicle.pilots.count > 0 {
            data.append((label: "Pilots", value: StringValue(value: ""), cellIdentifier: TitleCell.reuseIdentifier))
            
            for pilot in vehicle.pilots {
                data.append((label: "", value: ResourceValue(url: pilot, resource: SWCharacterResource()), cellIdentifier: NamableDataCell.reuseIdentifier))
            }
        }
        
        self.data = data;
    }
}
