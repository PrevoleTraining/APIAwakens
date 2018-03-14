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
    
    var sizables: [Sizable]?
    var detailTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = buttonsDataSource
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? DataViewController {
            prepare(controller: controller, sizables: sizables!, label: detailTitle!)
        }
    }
    
    func willDownload() {
        self.tableView.isUserInteractionEnabled = false
    }
    
    func didDownload(title: String?, collection: [Sizable]) {
        self.tableView.isUserInteractionEnabled = true
        self.detailTitle = title
        self.sizables = collection
        performSegue(withIdentifier: "viewDetails", sender: nil)
    }
    
    // Mark: - Helpers
    
    func prepare(controller: DataViewController, sizables: [Sizable], label: String) {
        do {
            try controller.data = DataCollection(collectionLabel: label, sizables: sizables)
        } catch {
            fatalError()
        }
    }
}

