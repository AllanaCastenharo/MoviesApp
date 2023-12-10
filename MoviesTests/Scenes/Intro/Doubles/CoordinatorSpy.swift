//
//  CoordinatorSpy.swift
//  MoviesTests
//
//  Created by Allana Castenharo Santamaria on 05/12/23.
//

import Foundation
import UIKit
@testable import Movies

class CoordinatorSpy: IntroCoordinatorProtocol {
    var viewController: UIViewController?
    
    enum Method: Equatable {
        case showMoviesCalled
    }
    
    private(set) var receivedMethods: [Method] = []
    
    func showMovies() {
        receivedMethods.append(.showMoviesCalled)
    }
}
