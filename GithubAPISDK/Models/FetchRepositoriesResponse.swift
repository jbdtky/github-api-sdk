//
//  FetchRepositoriesResponse.swift
//  GithubAPISDK
//
//  Created by Jean-Baptiste Dominguez on 2020/03/08.
//  Copyright © 2020 Jean-Baptiste Dominguez. All rights reserved.
//

import Foundation

public struct FetchRepositoriesResponse: Decodable {
    var items: [Repository]
    var totalCount: Int
    var incompleteResults: Bool
    
    enum CodingKeys: String, CodingKey {
        case items
        case incompleteResults = "incomplete_results"
        case totalCount = "total_count"
    }
}
