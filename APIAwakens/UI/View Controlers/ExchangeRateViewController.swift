//
//  ExchangeRateViewController.swift
//  APIAwakens
//
//  Created by lprevost on 03.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import UIKit

class ExchangeRateViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var exchangeRateField: UITextField!
    
    var rateModalDelegate: RateModalDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exchangeRateField.delegate = self
        
        if let delegate = rateModalDelegate {
            exchangeRateField.text = "\(delegate.rate)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func ok(_ sender: UIButton) {
        let exchangeRate = Double(exchangeRateField.text!)!
        
        if exchangeRate > 0 {
            dismiss(animated: true) {
                self.rateModalDelegate?.confirm(rate: exchangeRate)
            }
        } else {
            present(ErrorViewController.instantiate(errorMessage: "The exchange rate must be positive"), animated: false, completion: nil)
        }
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "" {
            return true
        }
        
        let invalidCharacters = CharacterSet(charactersIn: "0123456789.").inverted
        let maskValid = string.rangeOfCharacter(from: invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
        
        if !maskValid {
            return false
        } else {
            if let text = textField.text {
                if text.contains(".") && string.contains(".") {
                    return false
                } else {
                    return true
                }
            } else {
                return true
            }
        }
    }
}
