//
//  MoviesSearchFactory.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 27/05/22.
//

import UIKit

public struct MoviesSearchFactory {
    static func make() -> UIViewController {
        let service = MoviesSearchService()
        let coordinator = MoviesListCoordinator()
        let presenter = MoviesListPresenter(coordinator: coordinator)
        let localStorage = LocalStorage()

        let interactor = MoviesSearchInteractor(
            service: service,
            presenter: presenter,
            localStorage: localStorage)
        let viewController = MoviesSearchViewController(interactor: interactor)
        
        coordinator.viewController = viewController
        presenter.viewController = viewController
        
        return viewController
    }
}
