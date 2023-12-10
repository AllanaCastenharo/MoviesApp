//
//  IntroInteractorSpy.swift
//  MoviesTests
//
//  Created by Allana Castenharo Santamaria on 04/06/22.
//

import Foundation
@testable import Movies

class IntroInteractorSpy: IntroInteractorProtocol {
    enum Method: Equatable {
        case openMoviesCalled
    }

    private(set) var receivedMethods: [Method] = []

    func openMovies() {
        receivedMethods.append(.openMoviesCalled)
    }

}
