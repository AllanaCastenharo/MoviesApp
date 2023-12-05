//
//  MovieDetailInteractorSpy.swift
//  MoviesTests
//
//  Created by Allana Castenharo Santamaria on 04/06/22.
//

import Foundation
@testable import Movies

final class MovieDetailInteractorSpy: MovieDetailInteracting {

    private(set) var openDetailCalled = false
    
    func openDetail() {
        openDetailCalled = true
    }
}
