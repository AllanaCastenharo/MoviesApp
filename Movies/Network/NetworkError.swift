//
//  NetworkError.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 03/06/22.
//

import Foundation

public enum NetworkError: Error {
    case notFound
    case unauthorized
    case badRequest
    case connectionFailure
    case requestError(Error)
    case malformedRequest
    case serverError
    case timeout
    case unknown
    case unitTest
}
