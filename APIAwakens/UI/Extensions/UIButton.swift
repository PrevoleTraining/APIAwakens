//
//  UIButton.swift
//  APIAwakens
//
//  Created by lprevost on 25.02.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import UIKit

extension UIButton {
    // From: https://gist.github.com/bleft/a1a7a39c3f90edefc5644369f918a74e
    func centerImageAndButton(_ gap: CGFloat, imageOnTop: Bool) {
        guard let imageView = self.imageView, let titleLabel = self.titleLabel else {
            return
        }
        
        let sign: CGFloat = imageOnTop ? 1 : -1;
        let imageSize = imageView.frame.size;
        self.titleEdgeInsets = UIEdgeInsetsMake((imageSize.height + gap) * sign, -imageSize.width, 0, 0);
        
        let titleSize = titleLabel.bounds.size;
        self.imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height + gap) * sign, 0, 0, -titleSize.width);
    }
}
