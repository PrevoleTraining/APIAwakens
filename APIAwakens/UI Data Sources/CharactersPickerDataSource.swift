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
    typealias Observer = (_ character: SWCharacter) -> Void
    
    private var characters: [SWCharacter] = []
    
    private var current: Int = 0
    
    private var observer: Observer?
    
    func observe(_ observer: @escaping Observer) {
        self.observer = observer
        notify()
    }
    
    func update(characters: [SWCharacter]) {
        self.characters = characters
        self.current = 0
        notify()
    }
    
    private func notify() {
        if let observer = observer, current < characters.count {
            observer(characters[current])
        }
    }
    
    // MARK: - Data Source
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return characters.count
    }
    
    // MARK: - Delegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return characters[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        current = row
        notify()
    }
}
