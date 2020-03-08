//
//  APIThrottlerTests.swift
//  GithubAPISDKTests
//
//  Created by Jean-Baptiste Dominguez on 2020/03/08.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import XCTest
@testable import GithubAPISDK

class APIThrottlerTests: XCTestCase {
    
    func testSerial() {
        let throttler = APIThrottler(maximumSimultaneously: 1)
        
        var expectations: [XCTestExpectation] = []
        let amountOfRequest = 2
        var shouldBeId = 0
        
        for i in 0...amountOfRequest {
            let expectSuccess = expectation(description: "Success \(i)")
            expectations.append(expectSuccess)
            
            let request = APIRequestMockWithDelay(UInt32(amountOfRequest - i), completion: { _ in
                // The request should be sequencial
                XCTAssertEqual(shouldBeId, i)
                shouldBeId += 1
                
                expectSuccess.fulfill()
            })
            
            throttler.enqueue(request)
        }
        
        wait(for: expectations, timeout: 5.0)
    }
}
