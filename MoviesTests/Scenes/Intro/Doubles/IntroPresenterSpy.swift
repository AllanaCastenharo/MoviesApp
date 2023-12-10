//
//  IntroPresenterSpy.swift
//  MoviesTests
//
//  Created by Allana Castenharo Santamaria on 05/06/22.
//

import Foundation
@testable import Movies

class IntroPresenterSpy: IntroPresenterProtocol {
    enum Method: Equatable {
        case presentMoviesCalled
    }

    private(set) var receivedMethods: [Method] = []

    func presentMovies() {
        receivedMethods.append(.presentMoviesCalled)
    }

}
