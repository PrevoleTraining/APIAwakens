//
//  Namable.swift
//  APIAwakens
//
//  Created by lprevost on 03.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

protocol Namable {
    var typeName: String { get }
    var name: String { get }
    var id: String { get }
}
