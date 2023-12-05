//
//  IntroPresenterTests.swift
//  MoviesTests
//
//  Created by Allana Castenharo Santamaria on 01/06/22.
//

import XCTest
@testable import Movies

final class CoordinatorSpy: IntroCoordinating {
    var viewController: UIViewController?
    
    enum Message: Equatable {
        case showMoviesCalled
    }
    
    private(set) var receivedMessages: [Message] = []
    
    func showMovies() {
        receivedMessages.append(.showMoviesCalled)
    }
}

class IntroPresenterTests: XCTestCase {
    func testPresentMovies_ShouldShowMoviesListScreen() {
        let (sut, coordinatorSpy) = makeSut()
        
        sut.presentMovies()
        
        XCTAssertEqual(coordinatorSpy.receivedMessages, [.showMoviesCalled])
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
