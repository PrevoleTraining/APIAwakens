//
//  Sizable.swift
//  APIAwakens
//
//  Created by lprevost on 03.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

protocol Classifiable: Namable {
    var classifierWeight: Double? { get }
    var classifierLabel: ClassifiableLabel { get }
}

enum ClassifiableLabel {
    case longestSmallest
    case largestSmallest
    case tallestSmallest
    case oldestLatest
    
    func labels() -> (first: String, last: String) {
        switch self {
        case .longestSmallest: return ("Longest", "Smallest")
        case .largestSmallest: return ("Largest", "Smallest")
        case .tallestSmallest: return ("Tallest", "Smallest")
        case .oldestLatest: return ("Oldest", "Latest")
        }
    }
}
