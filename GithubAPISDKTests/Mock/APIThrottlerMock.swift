//
//  APIThrottlerMock.swift
//  GithubAPISDKTests
//
//  Created by Jean-Baptiste Dominguez on 2020/03/08.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import Foundation
@testable import GithubAPISDK

class APIThrottlerMock: APIThrottler {
    
    var hasEnqueue = false
    
    override func enqueue(_ request: APIRequest) {
        hasEnqueue = true
    }
}
