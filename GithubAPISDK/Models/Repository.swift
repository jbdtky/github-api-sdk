//
//  Repository.swift
//  GithubAPISDK
//
//  Created by Jean-Baptiste Dominguez on 2020/03/08.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import Foundation

public struct Repository: Codable {
    public var name: String
    public var privacyStatus: Bool
    public var description: String
    public var language: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case privacyStatus = "private"
        case description
        case language
    }
}
