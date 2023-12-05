//
//  MovieDetailInteractor.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 04/12/23.
//

import Foundation
protocol MovieDetailInteracting: AnyObject {
    var model: MoviesModel { get }
}

final class MovieDetailInteractor: MovieDetailInteracting {
    var model: MoviesModel
    
    init(model: MoviesModel) {
        self.model = model
    }
}

