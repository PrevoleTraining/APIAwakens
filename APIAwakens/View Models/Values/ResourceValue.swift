//
//  UrlValue.swift
//  APIAwakens
//
//  Created by lprevost on 14.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

struct ResourceValue: DataValue {
    var formatedValue: String {
        return ""
    }
    
    var url: String?
    var resource: Resource
    
    init(url: String?, resource: Resource) {
        self.url = url
        self.resource = resource
    }
}
