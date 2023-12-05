//
//  IntroCoordinatorTests.swift
//  MoviesTests
//
//  Created by Allana Castenharo Santamaria on 01/06/22.
//

import XCTest
@testable import Movies

final class IntroCoordinatorTests: XCTestCase {
    func test_showMovies_callsPushViewController() {
        let (sut, navigationSpy) = makeSut()
        
        sut.showMovies()
        
        XCTAssertTrue(navigationSpy.pushedViewController is MoviesListViewController)
        XCTAssertEqual(navigationSpy.pushViewControllerCallCount, 2)
    }
}

// MARK: - Helpers

extension IntroCoordinatorTests {
    func makeSut() -> (IntroCoordinator, UINavigationControllerSpy) {
        let viwControllerSpy = UIViewControllerSpy()
        let navigationSpy = UINavigationControllerSpy(rootViewController: viwControllerSpy)
        let sut = IntroCoordinator()
        sut.viewController = viwControllerSpy
        
        return (sut, navigationSpy)
    }
}


