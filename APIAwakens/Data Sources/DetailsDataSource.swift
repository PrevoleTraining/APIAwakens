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
            
            switch cell {
            case let dataCell as DataCell: dataCell.update(label: data.label, data: data.value)
            case let namableCell as NamableDataCell: namableCell.update(label: data.label, data: data.value as! ResourceValue)
            case let englishMetricCell as MetricDataCell: englishMetricCell.update(label: data.label, metricValue: data.value as! MetricValue)
            case let cashCell as CashDataCell: cashCell.update(label: data.label, cashValue: data.value as! CashValue)
            case let titleCell as TitleCell: titleCell.update(label: data.label)
            case let openingCrawlCell as OpeningCrawlDataCell: openingCrawlCell.update(title: data.label, value: data.value as! OpeningCrawlValue)
            default: fatalError("Unknown cell type")
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
