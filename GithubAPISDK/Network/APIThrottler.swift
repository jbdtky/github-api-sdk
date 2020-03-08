//
//  APIThrottler.swift
//  GithubAPISDK
//
//  Created by Jean-Baptiste Dominguez on 2020/03/08.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import Foundation

// Basic semaphore to throttle properly my requests
internal class APIThrottler {
    private let _semaphore: DispatchSemaphore
    private let _queue: DispatchQueue
    
    init(maximumSimultaneously: Int? = nil, queue: DispatchQueue? = nil) {
        _semaphore = DispatchSemaphore(value: maximumSimultaneously ?? 1)
        _queue = queue ?? DispatchQueue(label: "api-request", qos: .background)
    }
    
    func enqueue(_ request: APIRequest) {
        
        // Enter in my background thread
        _queue.async { [weak self] in
            // Take a slot
            self?._semaphore.wait()
            
            // Execute
            request.resume() {
                
                // Free a slot
                self?._semaphore.signal()
            }
        }
    }
}
