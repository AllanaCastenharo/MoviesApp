//
//  MoviesListFactory.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 28/11/23.
//

import UIKit

public struct MoviesListFactory {
    static func make() -> UIViewController {
        let service = MoviesListService()
        let coordinator = MoviesListCoordinator()
        let presenter = MoviesListPresenter(coordinator: coordinator)
        let localStorage = LocalStorage()
        let interactor = MoviesListInteractor(service: service,
                                              presenter: presenter,
                                              localStorage: localStorage)
        let viewController = MoviesListViewController(interactor: interactor)
        
        coordinator.viewController = viewController
        presenter.viewController = viewController
        
        return viewController
    }
    
    static func makeLikedMovies() -> UIViewController {
        let service = MoviesLikedService()
        let coordinator = MoviesListCoordinator()
        let presenter = MoviesListPresenter(coordinator: coordinator)
        let localStorage = LocalStorage()

        let interactor = MovieListLikedInteractor(
            service: service,
            presenter: presenter,
            localStorage: localStorage)
        let viewController = MoviesListLikedViewController(interactor: interactor)
        
        coordinator.viewController = viewController
        presenter.viewController = viewController
        
        return viewController
    }
    
}
