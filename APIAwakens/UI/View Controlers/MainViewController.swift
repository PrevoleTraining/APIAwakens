//
//  ViewController.swift
//  APIAwakens
//
//  Created by lprevost on 24.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController, MainButtonViewDelegate {
    lazy var buttonsDataSource: MainButtonsDataSource = {
        return MainButtonsDataSource(buttons: [
            MainButtonData(title: "Characters", image: UIImage(named: "icon-characters"), resource: SWCharacterResource(), delegate: self),
            MainButtonData(title: "Vehicles", image: UIImage(named: "icon-vehicles"), resource: VehicleResource(), delegate: self),
            MainButtonData(title: "Starships", image: UIImage(named: "icon-starships"), resource: StarshipResource(), delegate: self)
        ])
    }()
    
    var dataCollection: DataCollection?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = buttonsDataSource
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? DataViewController {
            controller.data = dataCollection
        }
    }
    
    func willDownload() {
        tableView.isUserInteractionEnabled = false
    }
    
    func didDownload(title: String?, collection: [Sizable]) {
        tableView.isUserInteractionEnabled = true

        if collection.count > 0 {
            dataCollection = DataCollection(collectionLabel: title!, sizables: collection)
            performSegue(withIdentifier: "viewDetails", sender: nil)
        } else {
            present(ErrorViewController.instantiate(error: .noData), animated: false, completion: nil)
        }
    }
    
    func downloadFailed(error: SWAPIError) {
        present(ErrorViewController.instantiate(error: error), animated: false, completion: nil)
        tableView.isUserInteractionEnabled = true
    }
}

