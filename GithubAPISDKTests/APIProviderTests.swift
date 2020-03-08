//
//  APIProviderTests.swift
//  GithubAPISDKTests
//
//  Created by Jean-Baptiste Dominguez on 2020/03/08.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import XCTest
@testable import GithubAPISDK

class APIProviderTests: XCTestCase {
    
    func testRequest() {
        let throttler = APIThrottlerMock()
        let provider = DefaultAPIProvider(throttler)
        let request = URLRequest(url: URL(fileURLWithPath: ""))
        
        provider.request(request) { _ in
            // Do nothing
        }
        
        XCTAssertTrue(throttler.hasEnqueue)
    }
}
