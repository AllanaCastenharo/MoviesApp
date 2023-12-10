//
//  MoviesListPresenter.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 28/11/23.
//

import Foundation

protocol MoviesListPresenterProtocol: AnyObject {
    func presentMoviesDetail(model: MoviesModel)
    func updateView()
    func updateNewItems(indexPaths: [IndexPath])
    func startLoading()
    func stopLoading()
}

class MoviesListPresenter: MoviesPresenter<MoviesListCoordinatorProtocol> {
    weak var viewController: MovieListViewControllerProcotol?
 
}

extension MoviesListPresenter: MoviesListPresenterProtocol {
    func updateNewItems(indexPaths: [IndexPath]) {
        viewController?.updateNewItems(indexPaths: indexPaths)
    }
    
    func presentMoviesDetail(model: MoviesModel) {
        coordinator.showMoviesDetail(model: model)

    }
    
    func updateView() {
        viewController?.updateView()
    }
    
    func startLoading() {
        viewController?.startLoading()
    }
    
    func stopLoading() {
        viewController?.stopLoading()
    }
}
