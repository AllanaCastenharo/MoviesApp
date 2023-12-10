//
//  MovieDetailInteractor.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 04/12/23.
//

import Foundation
protocol MovieDetailInteractorProtocol: AnyObject {
    var model: MoviesModel { get }
}

final class MovieDetailInteractor: MovieDetailInteractorProtocol {
    var model: MoviesModel
    
    init(model: MoviesModel) {
        self.model = model
    }
}

