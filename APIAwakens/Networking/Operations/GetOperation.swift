//
//  GetOperation.swift
//  APIAwakens
//
//  Created by lprevost on 13.03.18.
//  Copyright © 2018 prevole.ch. All rights reserved.
//

import Foundation

class GetOperation: BaseOperation {
    let url: URL
    
    var data: Data?
    var error: SWAPIError?
    
    init(url: URL) {
        self.url = url
    }
    
    override func main() {
        guard !isCancelled else {
            finish(true)
            return
        }
        
        executing(true)
        
        let task = JSONDownloader().jsonTask(with: url) { data, error in
            self.data = data
            self.error = error
            self.executing(false)
            self.finish(true)
        }
        
        task.resume()
    }
}
