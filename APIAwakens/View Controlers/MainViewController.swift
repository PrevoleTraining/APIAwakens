//
//  ViewController.swift
//  APIAwakens
//
//  Created by lprevost on 24.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    @IBOutlet weak var charactersButton: UIButton!
    @IBOutlet weak var starhipsButton: UIButton!
    @IBOutlet weak var vehiclesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton(charactersButton)
        setupButton(starhipsButton)
        setupButton(vehiclesButton)
        
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Mark: - UI Preparation
    func setupButton(_ button: UIButton) {
        button.centerImageAndButton(5, imageOnTop: true)
    }
}

