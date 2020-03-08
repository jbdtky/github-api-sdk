//
//  APIProviderMock.swift
//  GithubAPISDKTests
//
//  Created by Jean-Baptiste Dominguez on 2020/03/08.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import Foundation
@testable import GithubAPISDK

class APIProviderMock: APIProviderProtocol {
    func request(_ urlRequest: URLRequest, completion: @escaping (Result<Data, Error>) -> ()) {
        let path = Bundle(for: type(of: self)).path(forResource: "response_success", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        let data = try! Data(contentsOf: url)        
        completion(.success(data))
    }
}
