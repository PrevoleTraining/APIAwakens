//
//  CharacterViewModel.swift
//  APIAwakens
//
//  Created by lprevost on 25.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

struct CharacterViewModel {
    typealias LabelValue = (label: CharacterViewModelLabel, value: DataValue, cellIdentifier: String)
    
    enum CharacterViewModelLabel: String {
        case born = "Born"
        case homeworld = "Home"
        case height = "Height"
        case eyeColor = "Eyes"
        case hairColor = "Hair"
    }
    
    let name: String
    let data: [LabelValue]
}

extension CharacterViewModel {
    init(character: SWCharacter) {
        self.name = character.name
        
        var data: [LabelValue] = []
    
        data.append((label: .born, value: StringValue(value: character.birthYear), cellIdentifier: DataCell.reuseIdentifier))
        data.append((label: .homeworld, StringValue(value: character.homeworld), cellIdentifier: DataCell.reuseIdentifier))
        data.append((label: .height, EnglishMetricValue(valueInCm: character.heightInCm), cellIdentifier: EnglishMetricDataCell.reuseIdentifier))
        data.append((label: .eyeColor, StringValue(value: character.eyeColor), cellIdentifier: DataCell.reuseIdentifier))
        data.append((label: .hairColor, StringValue(value: character.hairColor), cellIdentifier: DataCell.reuseIdentifier))
        
        self.data = data;
    }
}
