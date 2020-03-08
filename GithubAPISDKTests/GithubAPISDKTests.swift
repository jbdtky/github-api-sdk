//
//  GithubAPISDKTests.swift
//  GithubAPISDKTests
//
//  Created by Jean-Baptiste Dominguez on 2020/03/08.
//  Copyright © 2020 Jean-Baptiste Dominguez. All rights reserved.
//

import XCTest
@testable import GithubAPISDK

class GithubAPISDKTests: XCTestCase {
    
    func testFetchRespositoriesSuccess() {
        let provider = APIProviderMock()
        let sdk = GithubAPISDK(provider)
        
        let expectSuccess = expectation(description: "Success call")
        
        sdk.fetchRepositories(.ios, organization: "test") { response in
            switch response {
            case let .success(repositories):
                XCTAssertEqual(repositories.count, 8)
                
                expectSuccess.fulfill()
                /// Check more in deep the details
            case .failure:
                XCTFail()
            }
        }
        
        wait(for: [expectSuccess], timeout: 5.0)
    }
    
    /// TODO:
    /// Test failure and other cases
}
