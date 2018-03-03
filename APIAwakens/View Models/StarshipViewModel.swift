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
        data.append((label: "Cost", StringValue(value: "\(starship.costInCredits)"), cellIdentifier: DataCell.reuseIdentifier))
        data.append((label: "Length", EnglishMetricValue(valueInCm: starship.lengthInM * 100), cellIdentifier: EnglishMetricDataCell.reuseIdentifier))
        data.append((label: "Class", StringValue(value: starship.vhcClass), cellIdentifier: DataCell.reuseIdentifier))
        data.append((label: "Crew", StringValue(value: "\(starship.crew)"), cellIdentifier: DataCell.reuseIdentifier))

        self.data = data;
    }
}
