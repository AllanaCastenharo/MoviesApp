//
//  MoviesSearchPresenter.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 27/05/22.
//

import Foundation

protocol MoviesSearchPresenting: AnyObject {
    func presentSearchMovies()
}

final class MoviesSearchPresenter: MoviesPresenter<MoviesSearchCoordinating> { }

extension MoviesSearchPresenter: MoviesSearchPresenting {
    func presentSearchMovies() {
        coordinator.searchMovies()
    }
}
