//
//  Log.swift
//  GithubAPISDK
//
//  Created by Jean-Baptiste Dominguez on 2020/03/08.
//  Copyright © 2020 Jean-Baptiste Dominguez. All rights reserved.
//

import Foundation

internal enum LogType: String {
    case debug = "Debug"
    case error = "Error"
}

internal class Log {
    private let prefix: String
    
    init(_ className: String) {
        guard let bundleId = Bundle.init(for: Log.self).bundleIdentifier else {
            fatalError("BundleId should be defined")
        }
        
        prefix = bundleId + ":" + className
    }
    
    private func showMessage(_ type: LogType, message: String) {
        let log: String = "[\(prefix)/\(type.rawValue)/\(Date().toString())] \(message)"
        print(log)
    }
    
    func d(_ message: String) {
        #if DEBUG
        showMessage(.debug, message: message)
        #endif
    }
    
    func e(_ message: String) {
        showMessage(.error, message: message)
    }
}
