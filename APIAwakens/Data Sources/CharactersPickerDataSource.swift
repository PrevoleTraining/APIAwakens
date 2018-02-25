//
//  CharactersPickerDataSource.swift
//  APIAwakens
//
//  Created by lprevost on 25.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation
import UIKit

class CharactersPickerDataSource: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    private var characters: [SWCharacter]
    
    init(characters: [SWCharacter]) {
        self.characters = characters
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return characters.count
    }
    
    func pickerView(_
        pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return characters[row].name
    }
}
