//
//  ErrorViewController.swift
//  APIAwakens
//
//  Created by lprevost on 14.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import UIKit

class ErrorViewController: UIViewController {
    var error: SWAPIError?
    
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    override func viewDidLoad() {
        if let error = error {
            errorMessageLabel.text = error.friendlyMessage
        }
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    static func instantiate(error: SWAPIError) -> ErrorViewController {
        let errorViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ErrorViewController") as! ErrorViewController
        errorViewController.error = error
        errorViewController.modalPresentationStyle = .overCurrentContext
        return errorViewController
    }
}
