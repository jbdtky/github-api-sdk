//
//  APIServiceMock.swift
//  GithubAPITests
//
//  Created by Jean-Baptiste Dominguez on 2020/03/08.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import Foundation
@testable import GithubAPISDK

enum APIServiceMockError: Error {
    case error
}

class APIServiceMock: APIService {
    
    func fetchRepositories(_ platform: Platform, organization: String, completion: @escaping (Result<FetchRepositoriesResponse, Error>) -> ()) {
        if organization == "error" {
            completion(.failure(APIServiceMockError.error))
        } else {
            completion(.success(
                FetchRepositoriesResponse(items: [
                    Repository(name: "Mock",
                               privacyStatus: true,
                               description: "Mock API",
                               language: "Swift")
                    ],
                    totalCount: 0,
                    incompleteResults: false)))
        }
    }
    
}
