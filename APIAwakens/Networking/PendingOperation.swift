//
//  PendingOperation.swift
//  APIAwakens
//
//  Created by lprevost on 07.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class PendingOperations {
    var downloadsInProgress = [IndexPath: Operation]()
    
    let downloadQueue = OperationQueue()
}
