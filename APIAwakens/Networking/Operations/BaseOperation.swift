//
//  BaseOperation.swift
//  APIAwakens
//
//  Created by lprevost on 13.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class BaseOperation: Operation {
    private var inExecution = false {
        willSet {
            willChangeValue(forKey: "isExecuting")
        }
        didSet {
            didChangeValue(forKey: "isExecuting")
        }
    }
    
    override var isExecuting: Bool {
        return inExecution
    }
    
    private var inEnding = false {
        willSet {
            willChangeValue(forKey: "isFinished")
        }
        
        didSet {
            didChangeValue(forKey: "isFinished")
        }
    }
    
    override var isFinished: Bool {
        return inEnding
    }
    
    func executing(_ executing: Bool) {
        inExecution = executing
    }
    
    func finish(_ finished: Bool) {
        inEnding = finished
    }
}
