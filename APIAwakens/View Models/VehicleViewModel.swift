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
        data.append((label: "Length", value: EnglishMetricValue(valueInCm: vehicle.lengthInM * 100), cellIdentifier: EnglishMetricDataCell.reuseIdentifier))
        data.append((label: "Class", value: StringValue(value: vehicle.vhcClass), cellIdentifier: DataCell.reuseIdentifier))
        data.append((label: "Crew", value: StringValue(value: "\(vehicle.crew)"), cellIdentifier: DataCell.reuseIdentifier))
        
        self.data = data;
    }
}
