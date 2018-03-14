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
    case jsonParsingFailure(message: String)
}
