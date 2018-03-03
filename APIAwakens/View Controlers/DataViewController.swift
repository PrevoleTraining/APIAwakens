//
//  CharaceterViewController.swift
//  APIAwakens
//
//  Created by lprevost on 25.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import UIKit

class DataViewController: UITableViewController, UIPickerViewDelegate {
    var data: DataCollection? {
        didSet {
            if let data = data {
                pickerDataSource.update(namables: data.namables)
                smallest = data.smallest.name
                largest = data.largest.name
                title = data.collectionLabel
            }
        }
    }
    
    private var smallest: String = "n/a"
    private var largest: String = "n/a"
    
    private let pickerDataSource = PickerDataSource()
    private let detailsDataSource = DetailsDataSource()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dataPicker: UIPickerView!
    
    @IBOutlet weak var smallestLabel: UILabel!
    @IBOutlet weak var largestLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = detailsDataSource
        dataPicker.dataSource = pickerDataSource
        dataPicker.delegate = pickerDataSource
        
        smallestLabel.text = smallest
        largestLabel.text = largest
        
        pickerDataSource.observe { viewModel in
            self.nameLabel.text = viewModel.name
            self.detailsDataSource.update(with: viewModel)
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLayoutSubviews() {
        tableView.adjustFooterViewHeightToFillTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "exchangeRateModal", let controller = segue.destination as? ExchangeRateViewController, let button = sender as? UIButton, let view = button.superview, let cell = view.superview as? CashDataCell {
            controller.rateModalDelegate = cell
        }
    }
}


