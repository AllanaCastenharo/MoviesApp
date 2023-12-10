//
//  IntroInteractor.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 27/05/22.
//

import Foundation

protocol IntroInteractorProtocol: AnyObject {
    func openMovies()
}

final class IntroInteractor: MoviesInteractor<IntroPresenterProtocol> { }

extension IntroInteractor: IntroInteractorProtocol {
    func openMovies() {
        presenter.presentMovies()
    }
}
