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
        data.append((label: "Cost", value: CashValue(valueInCredits: Int(vehicle.costInCredits)), cellIdentifier: CashDataCell.reuseIdentifier))
        data.append((label: "Length", value: MetricValue(valueInCm: vehicle.size * 100), cellIdentifier: MetricDataCell.reuseIdentifier))
        data.append((label: "Class", value: StringValue(value: vehicle.vhcClass), cellIdentifier: DataCell.reuseIdentifier))
        data.append((label: "Crew", value: StringValue(value: "\(vehicle.crew)"), cellIdentifier: DataCell.reuseIdentifier))
        
        if vehicle.pilots.count > 0 {
            data.append((label: "Pilots", value: StringValue(value: ""), cellIdentifier: TitleCell.reuseIdentifier))
            
            for pilot in vehicle.pilots {
                data.append((label: "", value: StringValue(value: pilot), cellIdentifier: NavigationCell.reuseIdentifier))
            }
        }
        
        self.data = data;
    }
}
