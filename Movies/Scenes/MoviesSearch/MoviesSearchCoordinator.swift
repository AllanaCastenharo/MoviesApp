//
// MoviesSearchCoordinator.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 27/05/22.
//

import UIKit

protocol MoviesSearchCoordinating: AnyObject {
    func searchMovies()
}

final class MoviesSearchCoordinator {
    weak var viewController: UIViewController?
}

extension MoviesSearchCoordinator: MoviesSearchCoordinating {
    func searchMovies() {
    }
}
