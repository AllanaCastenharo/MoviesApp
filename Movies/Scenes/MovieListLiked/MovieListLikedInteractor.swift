//
//  MovieLikedInteractor.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 04/12/23.
//

import Foundation

class MovieListLikedInteractor: MoviesListInteractor {
    override func fetchData(searchText: String? = nil) {
        model = localStorage.get(key: cacheKey)
        presenter.updateView()
    }
    
    override func saveLocalStorage(index: Int, executeDislike: @escaping () -> Void) {
        super.saveLocalStorage(index: index, executeDislike: executeDislike)
        fetchData()
    }
}
