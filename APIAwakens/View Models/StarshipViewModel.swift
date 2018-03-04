//
//  StarshipViewModel.swift
//  APIAwakens
//
//  Created by lprevost on 03.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

struct StarshipViewModel: ViewModel {
    let name: String
    let data: [LabelValue]
}

extension StarshipViewModel {
    init(starship: Starship) {
        self.name = starship.name
        
        var data: [LabelValue] = []
        
        data.append((label: "Make", value: StringValue(value: starship.manufacturer), cellIdentifier: DataCell.reuseIdentifier))
        data.append((label: "Cost", value: CashValue(valueInCredits: starship.costInCredits), cellIdentifier: CashDataCell.reuseIdentifier))
        data.append((label: "Length", value: MetricValue(valueInCm: starship.lengthInM * 100), cellIdentifier: MetricDataCell.reuseIdentifier))
        data.append((label: "Class", value: StringValue(value: starship.vhcClass), cellIdentifier: DataCell.reuseIdentifier))
        data.append((label: "Crew", value: StringValue(value: "\(starship.crew)"), cellIdentifier: DataCell.reuseIdentifier))

        if starship.pilots.count > 0 {
            data.append((label: "Pilots", value: StringValue(value: ""), cellIdentifier: TitleCell.reuseIdentifier))
            
            for pilot in starship.pilots {
                data.append((label: "", value: StringValue(value: pilot), cellIdentifier: NavigationCell.reuseIdentifier))
            }
        }
        
        self.data = data;
    }
}
