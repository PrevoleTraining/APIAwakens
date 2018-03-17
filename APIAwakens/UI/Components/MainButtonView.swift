//
//  MainButtonView.swift
//  APIAwakens
//
//  Created by lprevost on 11.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import UIKit

@IBDesignable class MainButtonView: UIView {
    var contentView: UIView!
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    var resource: Resource?
    var delegate: MainButtonViewDelegate?
    
    @IBInspectable var label: String? {
        get {
            return button.titleLabel?.text
        }
        set(newValue) {
            button.setTitle(newValue, for: .normal)
        }
    }

    @IBInspectable var image: UIImage? {
        get {
            return button.imageView?.image
        }
        set(newValue) {
            button.setImage(newValue, for: .normal)
            button.centerImageAndButton(5, imageOnTop: true)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    // MARK: - Actions
    
    @IBAction func load(_ sender: Any) {
        delegate?.willDownload()
        
        button.isHidden = true
        loader.startAnimating()
        
        if let resource = resource {
            resource.getAll(completion: { (items, error) in
                if let items = items {
                    self.delegate?.didDownload(title: self.label, collection: items)
                } else {
                    self.delegate?.downloadFailed(error: error!)
                }
                
                self.loader.stopAnimating()
                self.button.isHidden = false
            })
        }
    }
    
    // MARK: - Helpers
    
    ///
    /// Great inspiration from here: https://stackoverflow.com/a/40104211/1618785
    ///
    func xibSetup() {
        
        contentView = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        contentView.frame = bounds
        
        // Make the view stretch with containing view
        contentView.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(contentView)
        
        loader.stopAnimating()
    }
    
    private func loadViewFromNib() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
}

protocol MainButtonViewDelegate {
    func willDownload()
    func didDownload(title: String?, collection: [Classifiable])
    func downloadFailed(error: SWAPIError)
}
