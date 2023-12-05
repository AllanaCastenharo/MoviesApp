//
//  MoviesListPresenter.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 28/11/23.
//

import Foundation

protocol MoviesListPresenting: AnyObject {
    func presentMoviesDetail(model: MoviesModel)
    func updateView()
}

final class MoviesListPresenter: MoviesPresenter<MoviesListCoordinating> {
    weak var viewController: MovieListDisplaying?

}

extension MoviesListPresenter: MoviesListPresenting {
    func presentMoviesDetail(model: MoviesModel) {
        coordinator.showMoviesDetail(model: model)

    }
    
    func updateView() {
        viewController?.updateView()
    }
}
