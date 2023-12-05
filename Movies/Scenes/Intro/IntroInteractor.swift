//
//  IntroInteractor.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 27/05/22.
//

import Foundation

protocol IntroInteracting: AnyObject {
    func openMovies()
}

final class IntroInteractor: MoviesInteractor<IntroPresenting> { }

extension IntroInteractor: IntroInteracting {
    func openMovies() {
        presenter.presentMovies()
    }
}
