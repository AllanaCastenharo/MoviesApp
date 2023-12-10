//
//  MoviesSearchInteractor.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 27/05/22.
//

import Foundation

protocol MoviesSearchInteractorProtocol: AnyObject {
    func openSearchMovies()
}

final class MoviesSearchInteractor: MoviesListInteractor {
    override func fetchData(searchText: String?) {
        guard shouldFetch else {
            return
        }
        
        shouldFetch = false
        
        service.fetch(search: searchText ?? "", page: page) { [weak self] result in
            switch result {
            case .success(let response):
                self?.model = response
                self?.presenter.updateView()
                self?.shouldFetch = true
            case .failure:
                break
            }
        }
    }
}


