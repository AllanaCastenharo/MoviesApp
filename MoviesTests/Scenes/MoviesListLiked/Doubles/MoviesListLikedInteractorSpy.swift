//
//  MoviesListLikedInteractorSpy.swift
//  MoviesTests
//
//  Created by Allana Castenharo Santamaria on 05/12/23.
//

import Foundation
@testable import Movies

class MoviesListLikedInteractorSpy: MoviesListInteractorProtocol {
    enum Method: Equatable {
        case openDetailCalled(index: Int)
        case fetchDataCalled
        case saveLocalStorageCalled
        case isFavoriteMovieCalled(index: Int)
    }

    private(set) var receivedMethods: [Method] = []

    var model: MoviesResponse?
    
    func openDetail(index: Int) {
            receivedMethods.append(.openDetailCalled(index: index))
    }
    
    func fetchData() {
            receivedMethods.append(.fetchDataCalled)
    }
    
    func saveLocalStorage(index: Int, executeDislike: @escaping () -> Void) {
            receivedMethods.append(.saveLocalStorageCalled)
    }
    
    func isFavoriteMovie(index: Int) -> Bool {
            receivedMethods.append(.isFavoriteMovieCalled(index: index))
        return false
    }

}
