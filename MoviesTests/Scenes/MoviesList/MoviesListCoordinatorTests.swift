//
//  MoviesListCoordinatorTests.swift
//  MoviesTests
//
//  Created by Allana Castenharo Santamaria on 01/06/22.
//

import XCTest
@testable import Movies

final class MoviesListCoordinatorTests: XCTestCase {
    func test_showMovieDetail_callsPushViewController() {
        let (sut, navigationSpy) = makeSut()
        
        sut.showMoviesDetail()
        
//        XCTAssertTrue(navigationSpy.pushedViewController is MovieDetailViewController)
        XCTAssertEqual(navigationSpy.pushViewControllerCallCount, 2)
    }
}

// MARK: - Helpers
extension MoviesListCoordinatorTests {
    func makeSut() -> (MoviesListCoordinator, UINavigationControllerSpy) {
        let viwControllerSpy = UIViewControllerSpy()
        let navigationSpy = UINavigationControllerSpy(rootViewController: viwControllerSpy)
        let sut = MoviesListCoordinator()
        sut.viewController = viwControllerSpy
        
        return (sut, navigationSpy)
    }
}


