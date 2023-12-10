//
//  MoviesDetailInteractorSpy.swift
//  MoviesTests
//
//  Created by Allana Castenharo Santamaria on 05/12/23.
//

import Foundation
@testable import Movies

class MovieDetailInteractorSpy: MovieDetailInteractorProtocol {
    var model: MoviesModel = .init(id: 1,
                                   title: "Título",
                                   overview: "Descrição",
                                   popularity: 90.0,
                                   posterPath: "Imagem")
    
    enum Method: Equatable {
    }

    private(set) var receivedMethods: [Method] = []

}
