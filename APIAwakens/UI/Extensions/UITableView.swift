//
//  UITableView.swift
//  APIAwakens
//
//  Created by lprevost on 25.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    // From: https://gist.github.com/alexmx/3bd217b25542fc3dd41fa79cfe2a22c7
    // Invoke from UITableViewController.viewDidLayoutSubviews()
    func adjustFooterViewHeightToFillTableView() {
        if let tableFooterView = tableFooterView {
            
            let minHeight = tableFooterView.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height
            
            let currentFooterHeight = tableFooterView.frame.height
            
            let fitHeight = frame.height - adjustedContentInset.top - contentSize.height  + currentFooterHeight
            let nextHeight = (fitHeight > minHeight) ? fitHeight : minHeight
            
            if (round(nextHeight) != round(currentFooterHeight)) {
                var frame = tableFooterView.frame
                frame.size.height = nextHeight
                tableFooterView.frame = frame
                self.tableFooterView = tableFooterView
            }
        }
    }
}
