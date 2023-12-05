//
//  MoviesListCoordinator.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 28/11/23.
//

import UIKit

protocol MoviesListCoordinating: AnyObject {
    func showMoviesDetail(model: MoviesModel)
}

final class MoviesListCoordinator {
    weak var viewController: UIViewController?
}

extension MoviesListCoordinator: MoviesListCoordinating {
    func showMoviesDetail(model: MoviesModel) {
        let controller = MovieDetailFactory.make(model: model)
        viewController?.navigationController?.pushViewController(controller, animated: true)
    }
}
