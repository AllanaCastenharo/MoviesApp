//
//  NetworkPrint.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 29/11/23.
//

import Foundation

internal enum PrintType {
    case success
    case failure
    case json(data: Data)
}

internal func print(items: Any..., separator: String = " ", terminator: String = "\n") {
    #if DEBUG
        let output = items.map { "\($0)" }.joined(separator: separator)
        print(output, terminator: terminator)
    #endif
}

internal func print(_ printType: PrintType, _ items: Any..., separator: String = " ", terminator: String = "\n") {
    #if DEBUG
    
    var status = ""
    var output = items.map { "\($0)" }.joined(separator: separator)
    
    switch printType {
    case .success:
        status = "✅"
    case .failure:
        status = "❌"
    case .json(data: let data):
        status = "📬"
        if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
            output = "Response: \(json)"
        }
    }

    print("\(status) \(output)", terminator: terminator)
    #endif
}
