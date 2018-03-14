//
//  SWAPIError.swift
//  APIAwakens
//
//  Created by lprevost on 07.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

enum SWAPIError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case wrongUrlFormat
    case jsonConversionFailure
    
    func friendlyMessage() -> String {
        switch self {
        case .requestFailed: return "Network error!"
        case .responseUnsuccessful: return "Bad server response!"
        case .invalidData: return "Data is invalid!"
        case .wrongUrlFormat: return "Wrong URL!"
        case .jsonConversionFailure: return "Unable to parse JSON data!"
        }
    }
}
