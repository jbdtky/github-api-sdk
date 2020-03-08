//
//  APIRequestMockWithDelay.swift
//  GithubAPISDKTests
//
//  Created by Jean-Baptiste Dominguez on 2020/03/08.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import Foundation
@testable import GithubAPISDK

class APIRequestMockWithDelay: APIRequest {
    
    private var _delay: UInt32
    
    init(_ delay: UInt32, completion: @escaping (Result<Data, Error>) -> ()) {
        _delay = delay
        
        // We don't care about the url
        super.init(URLRequest(url: URL(fileURLWithPath: "")), completion: completion)
    }
    
    override func resume() {
        sleep(_delay)
        _completion(.success(Data()))
    }
}
