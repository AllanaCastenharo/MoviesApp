//
//  MovieDetailInteractorTests.swift
//  MoviesTests
//
//  Created by Allana Castenharo Santamaria on 06/12/23.
//


import XCTest
@testable import Movies

final class MovieDetailInteractorTests: XCTestCase {
}

extension MovieDetailInteractorTests {
    func makeSut() -> (MovieDetailInteractor) {
        let sut = MovieDetailInteractor(model: MoviesModel.init(id: 1,
                                                                title: "",
                                                                overview: "",
                                                                popularity: 90.0,
                                                                posterPath: ""))

        return sut
    }
}
