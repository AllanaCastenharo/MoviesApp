//
//  MoviesListPresenterTests.swift
//  MoviesTests
//
//  Created by Allana Castenharo Santamaria on 01/06/22.
//

import XCTest
@testable import Movies

final class MoviesListCoordinatorSpy: MoviesListCoordinating {

    var viewController: UIViewController?
    
    enum Message: Equatable {
    }
    
    private(set) var receivedMessages: [Message] = []
    
}

class MoviesListPresenterTests: XCTestCase {
    func testPresentDetail_ShouldShowDetailScreen() {
        let (sut, coordinatorSpy) = makeSut()
        
        sut.presentMoviesDetail()
        
        XCTAssertEqual(coordinatorSpy.receivedMessages, [.showMoviesDetail])
    }
}

// MARK: - Helpers
extension MoviesListPresenterTests {
    func makeSut() -> (MoviesListPresenter, MoviesListCoordinatorSpy) {
        let coordinatorSpy = MoviesListCoordinatorSpy()
        let sut = MoviesListPresenter(coordinator: coordinatorSpy)        
        return (sut, coordinatorSpy)
    }
}
