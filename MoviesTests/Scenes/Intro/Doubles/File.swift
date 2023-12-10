//
//  CoordinatorSpy.swift
//  MoviesTests
//
//  Created by Allana Castenharo Santamaria on 05/12/23.
//

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
