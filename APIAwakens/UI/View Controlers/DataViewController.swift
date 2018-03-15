//
//  CharaceterViewController.swift
//  APIAwakens
//
//  Created by lprevost on 25.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import UIKit

class DataViewController: UITableViewController, UIPickerViewDelegate {
    private static let footerHeight = CGFloat(235)
    
    var data: DataCollection? {
        didSet {
            if let data = data {
                pickerDataSource.update(namables: data.namables)
                smallest = data.smallest
                largest = data.largest
                title = data.collectionLabel
            }
        }
    }
    
    private var smallest: String = ""
    private var largest: String = ""
    
    private let pickerDataSource = PickerDataSource()
    private let detailsDataSource = DetailsDataSource()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dataPicker: UIPickerView!
    
    @IBOutlet weak var smallestLabel: UILabel!
    @IBOutlet weak var largestLabel: UILabel!
    
    @IBOutlet var footerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.addSubview(footerView)
        
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
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        footerView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.contentInset = UIEdgeInsetsMake(0, 0, DataViewController.footerHeight, 0)
        
        NSLayoutConstraint.activate([
            footerView.bottomAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.bottomAnchor),
            footerView.leadingAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.trailingAnchor),
            footerView.heightAnchor.constraint(equalToConstant: DataViewController.footerHeight)
        ])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "exchangeRateModal", let controller = segue.destination as? ExchangeRateViewController, let button = sender as? UIButton, let view = button.superview, let cell = view.superview as? CashDataCell {
            controller.rateModalDelegate = cell
        }
    }
}


