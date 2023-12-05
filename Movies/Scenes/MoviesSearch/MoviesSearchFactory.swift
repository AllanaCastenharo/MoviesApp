//
//  MoviesSearchFactory.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 27/05/22.
//

import UIKit

public struct MoviesSearchFactory {
    static func make() -> UIViewController {
        let coordinator = MoviesSearchCoordinator()
        let presenter = MoviesSearchPresenter(coordinator: coordinator)
        let interactor = MoviesSearchInteractor(presenter: presenter)
        let viewController = MoviesSearchViewController(interactor: interactor)
        
        coordinator.viewController = viewController
        
        return viewController
    }
}
