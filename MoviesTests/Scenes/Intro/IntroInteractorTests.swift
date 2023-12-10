//
//  IntroInteractorTests.swift
//  MoviesTests
//
//  Created by Allana Castenharo Santamaria on 01/06/22.
//

import XCTest
@testable import Movies

final class IntroInteractorTests: XCTestCase {
    func testOpenMovies_ShouldCallsPresentMovies() {
        let (sut, presenterSpy) = makeSut()

        sut.openMovies()

        XCTAssertEqual(presenterSpy.receivedMethods, [.presentMoviesCalled])
    }
}

extension IntroInteractorTests {
    func makeSut() -> (IntroInteractor, IntroPresenterSpy) {
        let presenterSpy = IntroPresenterSpy()
        let sut = IntroInteractor(presenter: presenterSpy)

        return (sut, presenterSpy)
    }
}
