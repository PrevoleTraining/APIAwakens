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
    case noData
    case wrongUrlFormat
    case jsonConversionFailure(error: Error)
    case unknown(error: Error)
    
    var friendlyMessage: String {
        switch self {
        case .requestFailed: return "Network error!"
        case .responseUnsuccessful: return "Bad server response!"
        case .noData: return "No data available!"
        case .wrongUrlFormat: return "Wrong URL!"
        case .jsonConversionFailure(let error): return "Unable to parse JSON data! Error: \(error)"
        case .unknown(let error): return "Unexpected error: \(error)"
        }
    }
}
