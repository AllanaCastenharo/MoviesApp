//
//  MovieDetailInteractorTests.swift
//  MoviesTests
//
//  Created by Allana Castenharo Santamaria on 01/06/22.
//

import XCTest
@testable import Movies

final class MovieDetailInteractorTests: XCTestCase {
    func testOpenDetail_ShouldCallsPresentDetail() {
        let (sut, presenterSpy) = makeSut()

        sut.openDetail()

        XCTAssertEqual(presenterSpy.receivedMessages, [.presentMoviesDetail])
    }
}

extension MovieDetailInteractorTests {
    func makeSut() -> (MovieDetailInteractor, MovieDetailPresenterSpy) {
        let presenterSpy = MovieDetailPresenterSpy()
        let sut = MovieDetailInteractor(presenter: presenterSpy)

        return (sut, presenterSpy)
    }
}
