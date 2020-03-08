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
        
        sdk.fetchRepositories(.ios, organization: "test") { response in
            switch response {
            case let .success(response):
                XCTAssertFalse(response.incompleteResults)
                XCTAssertEqual(response.totalCount, 8)
                XCTAssertEqual(response.repositories.count, 8)
                /// Check more in deep the details
            case .failure:
                XCTFail()
            }
        }
    }
    
    /// TODO:
    /// Test failure and other cases
}
