//
//  Repository.swift
//  GithubAPISDK
//
//  Created by Jean-Baptiste Dominguez on 2020/03/08.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import Foundation

public struct Repository: Codable {
    var name: String
    var privacyStatus: Bool
    var description: String
    var language: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case privacyStatus = "privacy"
        case description
        case language
    }
}
