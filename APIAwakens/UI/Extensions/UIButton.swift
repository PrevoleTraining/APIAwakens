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
//        guard let imageView = self.imageView, let titleLabel = self.titleLabel else {
//            return
//        }
//
//        let sign: CGFloat = imageOnTop ? 1 : -1;
//        let imageSize = imageView.frame.size;
//        self.titleEdgeInsets = UIEdgeInsetsMake((imageSize.height + gap) * sign, -imageSize.width, 0, 0);
//
//        let titleSize = titleLabel.bounds.size;
//        self.imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height + gap) * sign, 0, 0, -titleSize.width);
        
        guard let imageSize = self.imageView?.image?.size,
            let text = self.titleLabel?.text,
            let font = self.titleLabel?.font
            else { return }
        
        self.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -imageSize.width, bottom: -(imageSize.height + gap), right: 0.0)
        let labelString = NSString(string: text)
        let titleSize = labelString.size(withAttributes: [NSAttributedStringKey.font: font])
        self.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + gap), left: 0.0, bottom: 0.0, right: -titleSize.width)
        let edgeOffset = abs(titleSize.height - imageSize.height) / 2.0;
        self.contentEdgeInsets = UIEdgeInsets(top: edgeOffset, left: 0.0, bottom: edgeOffset, right: 0.0)
    }
}
