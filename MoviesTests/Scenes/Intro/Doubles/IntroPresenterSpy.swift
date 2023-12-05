//
//  IntroPresenterSpy.swift
//  MoviesTests
//
//  Created by Allana Castenharo Santamaria on 05/06/22.
//

import Foundation
@testable import Movies

class IntroPresenterSpy: IntroPresenting {
    enum Message: Equatable {
        case presentMoviesCalled
    }

    private(set) var receivedMessages: [Message] = []

    func presentMovies() {
        receivedMessages.append(.presentMoviesCalled)
    }

}
