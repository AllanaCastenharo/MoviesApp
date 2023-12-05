//
//  MoviesListInteractorSpy.swift
//  MoviesTests
//
//  Created by Allana Castenharo Santamaria on 04/06/22.
//

import Foundation
@testable import Movies

final class MoviesListInteractorSpy: MoviesListInteracting {
    func openDetail(index: Int) {
        <#code#>
    }
    
    var model: MoviesResponse?

    private(set) var fetchDataCalled = false
    
    func fetchData() {
        fetchDataCalled = true
    }
}
