//
//  IntroPresenter.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 27/05/22.
//

import Foundation

protocol IntroPresenterProtocol: AnyObject {
    func presentMovies()
}

final class IntroPresenter: MoviesPresenter<IntroCoordinatorProtocol> { }

extension IntroPresenter: IntroPresenterProtocol {
    func presentMovies() {
        coordinator.showMovies()
    }
}
