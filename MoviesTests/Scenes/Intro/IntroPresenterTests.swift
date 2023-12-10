//
//  IntroPresenterTests.swift
//  MoviesTests
//
//  Created by Allana Castenharo Santamaria on 01/06/22.
//

import XCTest
@testable import Movies

class IntroPresenterTests: XCTestCase {
    func testPresentMovies_ShouldShowMoviesListScreen() {
        let (sut, coordinatorSpy) = makeSut()
        
        sut.presentMovies()
        
        XCTAssertEqual(coordinatorSpy.receivedMethods, [.showMoviesCalled])
    }
}

// MARK: - Helpers
extension IntroPresenterTests {
    func makeSut() -> (IntroPresenter, CoordinatorSpy) {
        let coordinatorSpy = CoordinatorSpy()
        let sut = IntroPresenter(coordinator: coordinatorSpy)        
        return (sut, coordinatorSpy)
    }
}
