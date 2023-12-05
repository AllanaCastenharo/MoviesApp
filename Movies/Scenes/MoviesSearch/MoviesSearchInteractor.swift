//
//  MoviesSearchInteractor.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 27/05/22.
//

import Foundation

protocol MoviesSearchInteracting: AnyObject {
    func openSearchMovies()
}

final class MoviesSearchInteractor: MoviesInteractor<MoviesSearchPresenting> { }

extension MoviesSearchInteractor: MoviesSearchInteracting {
    func openSearchMovies() {
        presenter.presentSearchMovies()
    }
}
