//
//  ViewController.swift
//  GithubAPISDKDemo
//
//  Created by Jean-Baptiste Dominguez on 2020/03/08.
//  Copyright © 2020 Jean-Baptiste Dominguez. All rights reserved.
//

import UIKit
import GithubAPISDK

class ViewController: UIViewController {
    
    private let instance = GithubAPISDK(
        DefaultAPIProvider(
            maximumSimultaneously: 10,
            queue: DispatchQueue.global(qos: .utility)))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        instance.fetchRepositories(.ios, organization: "rakutentech") { result in
            switch result {
            case let .success(response):
                print(response.repositories)
            case let .failure(error):
                print(error)
            }
        }
    }


}

