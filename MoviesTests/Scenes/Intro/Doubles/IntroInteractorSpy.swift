//
//  IntroInteractorSpy.swift
//  MoviesTests
//
//  Created by Allana Castenharo Santamaria on 04/06/22.
//

import Foundation
@testable import Movies

final class IntroInteractorSpy: IntroInteracting {
    private(set) var openMoviesCalled = false
    
    func openMovies() {
        openMoviesCalled = true
    }
}
