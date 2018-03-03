//
//  CharacterViewModel.swift
//  APIAwakens
//
//  Created by lprevost on 25.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

struct CharacterViewModel: ViewModel {
    let name: String
    let data: [LabelValue]
}

extension CharacterViewModel {
    init(character: SWCharacter) {
        self.name = character.name
        
        var data: [LabelValue] = []
    
        data.append((label: "Born", value: StringValue(value: character.birthYear), cellIdentifier: DataCell.reuseIdentifier))
        data.append((label: "Home", value: StringValue(value: character.homeworld), cellIdentifier: DataCell.reuseIdentifier))
        data.append((label: "Height", value: EnglishMetricValue(valueInCm: character.heightInCm), cellIdentifier: EnglishMetricDataCell.reuseIdentifier))
        data.append((label: "Eyes", value: StringValue(value: character.eyeColor), cellIdentifier: DataCell.reuseIdentifier))
        data.append((label: "Hair", value: StringValue(value: character.hairColor), cellIdentifier: DataCell.reuseIdentifier))
        
        self.data = data;
    }
}
