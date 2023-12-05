//
//  IntroPresenter.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 27/05/22.
//

import Foundation

protocol IntroPresenting: AnyObject {
    func presentMovies()
}

final class IntroPresenter: MoviesPresenter<IntroCoordinating> { }

extension IntroPresenter: IntroPresenting {
    func presentMovies() {
        coordinator.showMovies()
    }
}
