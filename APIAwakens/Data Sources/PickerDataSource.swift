//
//  CharactersPickerDataSource.swift
//  APIAwakens
//
//  Created by lprevost on 25.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation
import UIKit

class PickerDataSource: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    typealias Observer = (_ character: ViewModel) -> Void

    private var namables: [Namable] = []
    
    private var current: Int = 0
    
    private var observer: Observer?
    
    func observe(_ observer: @escaping Observer) {
        self.observer = observer
        notify()
    }
    
    func update(namables: [Namable]) {
        self.namables = namables
        self.current = 0
        notify()
    }
    
    private func notify() {
        if current < namables.count, let observer = observer {
            observer(ViewModelFactory.create(namable: namables[current]))
        }
    }
    
    // MARK: - Data Source
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return namables.count
    }
    
    // MARK: - Delegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return namables[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        current = row
        notify()
    }
}
