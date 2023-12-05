//
//  MovieDetailPresenterTests.swift
//  MoviesTests
//
//  Created by Allana Castenharo Santamaria on 01/06/22.
//

import XCTest
@testable import Movies

final class MovieDetailCoordinatorSpy: MovieDetailCoordinating {
    var viewController: UIViewController?
    
    enum Message: Equatable {
        case showLikeMovieCalled
    }
    
    private(set) var receivedMessages: [Message] = []
    
    func showLikeMovie() {
        receivedMessages.append(.showLikeMovieCalled)
    }
}

class MovieDetailPresenterTests: XCTestCase {
    func testPresentDetail_ShouldShowDetailScreen() {
        let (sut, coordinatorSpy) = makeSut()
        
        sut.presentMoviesDetail()
        
        XCTAssertEqual(coordinatorSpy.receivedMessages, [.showLikeMovieCalled])
    }
}

// MARK: - Helpers
extension MovieDetailPresenterTests {
    func makeSut() -> (MovieDetailPresenter, MovieDetailCoordinatorSpy) {
        let coordinatorSpy = MovieDetailCoordinatorSpy()
        let sut = MovieDetailPresenter(coordinator: coordinatorSpy)
        return (sut, coordinatorSpy)
    }
}
