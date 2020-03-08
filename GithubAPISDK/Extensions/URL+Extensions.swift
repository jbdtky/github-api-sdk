//
//  URL+Extensions.swift
//  GithubAPISDK
//
//  Created by Jean-Baptiste Dominguez on 2020/03/08.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import Foundation

internal extension URL {
    func appendingQuery(_ query: String) -> URL {
        var components = URLComponents(string: self.absoluteString)
        components?.query = query
        
        if let url = components?.url {
            return url
        }
        
        return self
    }
}
