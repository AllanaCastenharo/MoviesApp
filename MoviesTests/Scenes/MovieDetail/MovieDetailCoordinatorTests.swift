//
//  MovieDetailCoordinatorTests.swift
//  MoviesTests
//
//  Created by Allana Castenharo Santamaria on 01/06/22.
//

import XCTest
@testable import Movies

final class MovieDetailCoordinatorTests: XCTestCase {
    func test_showLike_callsPushViewController() {
        let (sut, navigationSpy) = makeSut()
        
        sut.showLikeMovie()
        
        XCTAssertEqual(navigationSpy.pushViewControllerCallCount, 2)
    }
}

// MARK: - Helpers
extension MovieDetailCoordinatorTests {
    func makeSut() -> (MovieDetailCoordinator, UINavigationControllerSpy) {
        let viwControllerSpy = UIViewControllerSpy()
        let navigationSpy = UINavigationControllerSpy(rootViewController: viwControllerSpy)
        let sut = MovieDetailCoordinator()
        sut.viewController = viwControllerSpy
        
        return (sut, navigationSpy)
    }
}


