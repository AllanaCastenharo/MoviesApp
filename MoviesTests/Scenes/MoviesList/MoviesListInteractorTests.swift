//
//  MoviesListInteractorTests.swift
//  MoviesTests
//
//  Created by Allana Castenharo Santamaria on 01/06/22.
//

import XCTest
@testable import Movies

final class MoviesListInteractorTests: XCTestCase {
    func testOpenMoviesList_ShouldCallsPresentMoviesList() {
        let (sut, presenterSpy) = makeSut()

        sut.fetchData()

//        XCTAssertEqual(presenterSpy.receivedMessages, [.presentMoviesDetailCalled])
    }
}

extension MoviesListInteractorTests {
    func makeSut() -> (MoviesListInteractor, MoviesListPresenterSpy) {
        let presenterSpy = MoviesListPresenterSpy()
        let serviceSpy = ServiceSpy()
        let sut = MoviesListInteractor(service: serviceSpy, presenter: presenterSpy)

        return (sut, presenterSpy)
    }
}


class ServiceSpy: MoviesListServicing {
    func fetch(completion: @escaping (Result<MoviesResponse, NetworkError>) -> Void) {
        //
    }
}
