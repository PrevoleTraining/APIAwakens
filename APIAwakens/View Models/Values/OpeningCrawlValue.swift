//
//  OpeningCrawlValue.swift
//  APIAwakens
//
//  Created by lprevost on 18.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation
import UIKit

struct OpeningCrawlValue: DataValue {
    var value: String
    var name: String
    var episode: Int
    
    var formatedValue: String {
        return value
            .replacingOccurrences(of: "\r\n", with: "\n\n")
            .replacingOccurrences(of: "\n\n\n\n", with: "<br>")
            .replacingOccurrences(of: "\n\n", with: " ")
            .replacingOccurrences(of: "<br>", with: "\n\n")
    }
    
    var attributedText: NSAttributedString {
        get {
            let centeredParagraph = NSMutableParagraphStyle()
            centeredParagraph.alignment = .center
            
            let justifiedParagraph = NSMutableParagraphStyle()
            justifiedParagraph.alignment = .justified
            
            let firstLine = NSAttributedString(string: "Episode \(episode.roman)\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 18.0), .paragraphStyle: centeredParagraph])
            let secondLine = NSAttributedString(string: "\(name)\n\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 24.0), .paragraphStyle: centeredParagraph])
            let remainingLines = NSAttributedString(string: formatedValue, attributes: [.font: UIFont.systemFont(ofSize: 16.0), .paragraphStyle: justifiedParagraph])
          
            let text = NSMutableAttributedString(attributedString: firstLine)
            text.append(secondLine)
            text.append(remainingLines)
            
            return text
        }
    }
}
