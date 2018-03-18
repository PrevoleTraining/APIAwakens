//
//  OpeningCrawlViewController.swift
//  APIAwakens
//
//  Created by lprevost on 17.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import UIKit

class OpeningCrawlViewController: UIViewController {
    let scrollingConstraintWidth = CGFloat(100.0)
    let labelLeadingTrailingStandardWidth = CGFloat(16.0)
    
    @IBOutlet weak var openingCrawlLabel: UILabel!
    
    @IBOutlet weak var rightConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftConstraint: NSLayoutConstraint!
    
    var openingCrawlText: OpeningCrawlValue?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let text = openingCrawlText {
            openingCrawlLabel.isHidden = false
            
            rightConstraint.constant = scrollingConstraintWidth
            leftConstraint.constant = scrollingConstraintWidth
            
            openingCrawlLabel.attributedText = text.attributedText
        
            openingCrawlLabel.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            
            // Start with a blank transform
            var blankTransform = CATransform3DIdentity
            
            // Skew the text
            blankTransform.m34 = -1.0 / 400.0;
            
            // Rotate the text
            blankTransform = CATransform3DRotate(blankTransform, CGFloat(50.0 * Double.pi / 180.0), 1.0, 0.0, 0.0)
            
            // Set the transform
            openingCrawlLabel.superview!.layer.sublayerTransform = blankTransform
            
            // Put the text out the screen at the bottom
            openingCrawlLabel.transform = CGAffineTransform(translationX: 0, y: view.frame.size.height - 140)
            
            UIView.animate(withDuration: 80, delay: 0, options: .curveLinear, animations: {
                self.openingCrawlLabel.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.size.height)
            }, completion: { _ in
                self.openingCrawlLabel.transform = CGAffineTransform.identity
                self.openingCrawlLabel.superview!.layer.sublayerTransform = CATransform3DIdentity
                self.leftConstraint.constant = self.labelLeadingTrailingStandardWidth
                self.rightConstraint.constant = self.labelLeadingTrailingStandardWidth
            })
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        if isMovingFromParentViewController {
            openingCrawlLabel.isHidden = true
        }
        
        super.viewWillDisappear(animated)
    }
}
