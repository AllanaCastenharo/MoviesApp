//
//  MovieDetailPresenterSpy.swift
//  MoviesTests
//
//  Created by Allana Castenharo Santamaria on 05/06/22.
//

import Foundation
@testable import Movies

class MovieDetailPresenterSpy: MovieDetailPresenting {
    enum Message: Equatable {
        case presentMoviesDetail
    }

    private(set) var receivedMessages: [Message] = []

    func presentMoviesDetail() {
        receivedMessages.append(.presentMoviesDetail)
    }
}
