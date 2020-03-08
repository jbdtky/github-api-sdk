//
//  FetchRepositoriesResponse.swift
//  GithubAPISDK
//
//  Created by Jean-Baptiste Dominguez on 2020/03/08.
//  Copyright © 2020 Jean-Baptiste Dominguez. All rights reserved.
//

import Foundation

public struct FetchRepositoriesResponse: Decodable {
    public var repositories: [Repository]
    public var totalCount: Int
    public var incompleteResults: Bool
    
    enum CodingKeys: String, CodingKey {
        case repositories = "items"
        case incompleteResults = "incomplete_results"
        case totalCount = "total_count"
    }
}
