//
//  GithubAPISDK.swift
//  GithubAPISDK
//
//  Created by Jean-Baptiste Dominguez on 2020/03/08.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import Foundation

public enum Platform: String {
    case ios = "ios"
    case android = "android"
}

public protocol GithubAPISDKProtocol {
    func fetchRepositories(_ platform: Platform, organization: String, completion: @escaping (Result<FetchRepositoriesResponse, Error>) -> ())
}

public class GithubAPISDK: GithubAPISDKProtocol {
    
    private var _provider: APIProviderProtocol
    
    private var _baseUrl: URL {
        guard let url = URL(string: "https://api.github.com") else {
            fatalError("should init successfully")
        }
        
        return url
    }
    
    public init(_ provider: APIProviderProtocol = DefaultAPIProvider()) {
        _provider = provider
    }
    
    public func fetchRepositories(_ platform: Platform, organization: String, completion: @escaping (Result<FetchRepositoriesResponse, Error>) -> ()) {
        
        // TODO: The request mays be improved by doing an enum as Moya does
        return _provider
            .request(
                URLRequest(url: _baseUrl
                    .appendingPathComponent("/search/repositories")
                    .appendingQuery("q=" + platform.rawValue + "+org:" + organization))
            ) { result in
                switch result {
                case .success(let data):
                    do {
                        let response = try JSONDecoder().decode(FetchRepositoriesResponse.self, from: data)
                        completion(.success(response))
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
