//
//  CharacterDetailDataSource.swift
//  APIAwakens
//
//  Created by lprevost on 25.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation
import UIKit

class DetailsDataSource: NSObject, UITableViewDataSource {
    private var viewModel: ViewModel?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {
            return 0
        }
        
        return viewModel.data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let viewModel = viewModel {
            let data = viewModel.data[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: data.cellIdentifier)
            
            if let dataCell = cell as? DataCell {
                dataCell.update(label: data.label, data: data.value)
            } else if let englishMetricCell = cell as? EnglishMetricDataCell {
                englishMetricCell.update(label: data.label, metricValue: data.value as! EnglishMetricValue)
            }
            
            return cell!
        } else {
            return tableView.dequeueReusableCell(withIdentifier: DataCell.reuseIdentifier, for: indexPath)
        }
    }
    
    func update(with viewModel: ViewModel) {
        self.viewModel = viewModel
    }
}
