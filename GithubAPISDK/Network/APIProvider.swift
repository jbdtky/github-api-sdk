//
//  APIProvider.swift
//  GithubAPISDK
//
//  Created by Jean-Baptiste Dominguez on 2020/03/08.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import Foundation

public protocol APIProviderProtocol {
    func request(_ urlRequest: URLRequest, completion: @escaping (Result<Data, Error>) -> ())
}

public class DefaultAPIProvider: APIProviderProtocol {
    
    private let _throttler: APIThrottler
    
    public init(maximumSimultaneously: Int? = nil, queue: DispatchQueue? = nil) {
        _throttler = APIThrottler(maximumSimultaneously: maximumSimultaneously, queue: queue)
    }
    
    /// Internal usage
    init(_ throttler: APIThrottler) {
        _throttler = throttler
    }
    
    public func request(_ urlRequest: URLRequest, completion: @escaping (Result<Data, Error>) -> ()) {
        let request = APIRequest(urlRequest, completion: completion)
        _throttler.enqueue(request)
    }
}
