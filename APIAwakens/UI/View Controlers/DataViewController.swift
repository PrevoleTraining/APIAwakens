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
    private static let backgroundHeight = CGFloat(50)
    
    var data: DataCollection? {
        didSet {
            if let data = data {
                pickerDataSource.update(namables: data.namables)
                first = data.first
                last = data.last
                title = data.collectionLabel
                footerView.isHidden = false
            }
        }
    }
    
    var singleData: Namable? {
        didSet {
            if let namable = singleData {
                title = namable.typeName
                pickerDataSource.update(namables: [namable])
            }
        }
    }
    
    private var first: Classifiable?
    private var last: Classifiable?
    
    private let pickerDataSource = PickerDataSource()
    private let detailsDataSource = DetailsDataSource()
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dataPicker: UIPickerView!
    
    @IBOutlet weak var firstTitleLabel: UILabel!
    @IBOutlet weak var firstValueLabel: UILabel!

    @IBOutlet weak var lastTitleLabel: UILabel!
    @IBOutlet weak var lastValueLabel: UILabel!
    
    @IBOutlet var footerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.addSubview(backgroundView)
        tableView.addSubview(footerView)
        
        tableView.dataSource = detailsDataSource
        
        dataPicker.dataSource = pickerDataSource
        dataPicker.delegate = pickerDataSource
        
        if let first = first {
            firstTitleLabel.text = first.classifierLabel.labels().first
            firstValueLabel.text = first.name
        }
        
        if let last = last {
            lastTitleLabel.text = last.classifierLabel.labels().last
            lastValueLabel.text = last.name
        }
        
        pickerDataSource.observe { viewModel in
            self.nameLabel.text = viewModel.name
            self.detailsDataSource.update(with: viewModel)
            self.tableView.reloadData()
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundView.bottomAnchor.constraint(equalTo: tableView.superview!.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.trailingAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: DataViewController.backgroundHeight)
        ])
        
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
        } else {
            if let indexPath = tableView.indexPathForSelectedRow, let cell = tableView.cellForRow(at: indexPath) {
                if segue.identifier == "accessoryViewDetails", let controller = segue.destination as? DataViewController, let namableDataCell = cell as? NamableDataCell {
                    controller.singleData = namableDataCell.entity
                } else if segue.identifier == "openingCrawlSegue", let controller = segue.destination as? OpeningCrawlViewController, let openingCrawlCell = cell as? OpeningCrawlDataCell {
                    controller.openingCrawlText = openingCrawlCell.openingText
                }
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
}
