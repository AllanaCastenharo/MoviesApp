//
//  MoviesListPresenterSpy.swift
//  MoviesTests
//
//  Created by Allana Castenharo Santamaria on 05/12/23.
//

import Foundation
@testable import Movies

class MoviesListPresenterSpy: MoviesListPresenterProtocol {
    enum Method: Equatable {
        case presentMoviesDetailCalled(model: MoviesModel)
        case updateViewCalled
    }

    private(set) var receivedMethods: [Method] = []
    
    func presentMoviesDetail(model: MoviesModel) {
        receivedMethods.append(.presentMoviesDetailCalled(model: model))
    }
    
    func updateView() {
        receivedMethods.append(.updateViewCalled)
    }

}
