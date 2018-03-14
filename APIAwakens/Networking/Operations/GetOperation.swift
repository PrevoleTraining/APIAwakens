//
//  GetOperation.swift
//  APIAwakens
//
//  Created by lprevost on 13.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class GetOperation: Operation {
    let url: URL
    
    var data: Data?
    var error: SWAPIError?
    
    // MARK: - Override flags
    
    private var inExecution = false {
        willSet {
            willChangeValue(forKey: "isExecuting")
        }
        didSet {
            didChangeValue(forKey: "isExecuting")
        }
    }
    
    private var inEnding = false {
        willSet {
            willChangeValue(forKey: "isFinished")
        }
        
        didSet {
            didChangeValue(forKey: "isFinished")
        }
    }
    
    // MARK: - Overrides
    
    init(url: URL) {
        self.url = url
    }
    
    override var isExecuting: Bool {
        return inExecution
    }
    
    override var isFinished: Bool {
        return inEnding
    }
    
    override func main() {
        guard !isCancelled else {
            inExecution = false
            inEnding = true
            return
        }
        
        inExecution = true
        
        let task = JSONDownloader().jsonTask(with: url) { data, error in
            self.data = data
            self.error = error
            self.inExecution = false
            self.inEnding = true
        }
        
        task.resume()
    }
}
