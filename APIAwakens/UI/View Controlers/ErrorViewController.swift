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
    var errorMessage: String?
    
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    override func viewDidLoad() {
        if let error = error {
            errorMessageLabel.text = error.friendlyMessage
        }
        
        if let errorMessage = errorMessage {
            errorMessageLabel.text = errorMessage
        }
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    static func instantiate(error: SWAPIError) -> ErrorViewController {
        return instantiate(error: error, errorMessage: nil)
    }

    static func instantiate(errorMessage: String) -> ErrorViewController {
        return instantiate(error: nil, errorMessage: errorMessage)
    }
    
    private static func instantiate(error: SWAPIError?, errorMessage: String?) -> ErrorViewController {
        let errorViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ErrorViewController") as! ErrorViewController
        errorViewController.error = error
        errorViewController.errorMessage = errorMessage
        errorViewController.modalPresentationStyle = .overCurrentContext
        return errorViewController
    }
}
