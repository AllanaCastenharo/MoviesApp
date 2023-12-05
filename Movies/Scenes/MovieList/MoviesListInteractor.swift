//
//  MoviesListInteractor.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 04/12/23.
//

import Foundation

protocol MoviesListInteracting: AnyObject {
    var model: MoviesResponse? { get }
    func openDetail(index: Int)
    func fetchData()
    func saveLocalStorage(index: Int, executeDislike: @escaping () -> Void)
    func isFavoriteMovie(index: Int) -> Bool
}

class MoviesListInteractor: MoviesInteractor<MoviesListPresenting> {
    var service: MoviesListServicing
    var localStorage: LocalStorageProtocol
    var model: MoviesResponse?
    let cacheKey = "moviesLocalStorage"
    
    init(service: MoviesListServicing, presenter: MoviesListPresenting, localStorage: LocalStorageProtocol) {
        self.service = service
        self.localStorage = localStorage
        super.init(presenter: presenter)
    }
}

extension MoviesListInteractor: MoviesListInteracting {
    func openDetail(index: Int) {
        guard let movie = model?.results[index] else {
            return
        }
        
        presenter.presentMoviesDetail(model: movie)
    }
    
    @objc func fetchData() {
        service.fetch { [weak self] result in
            switch result {
            case .success(let response):
                self?.model = response
                self?.presenter.updateView()
            case .failure:
                break
            }
        }
    }
    
    func isFavoriteMovie(index: Int) -> Bool {
        if let cache: MoviesResponse = localStorage.get(key: cacheKey) {
            return cache.results.contains(where: { $0.id == model?.results[index].id })
        }
        
        return false
    }
    
    @objc func saveLocalStorage(index: Int, executeDislike: @escaping () -> Void) {
        guard let movie = model?.results[index] else {
            return
        }
                
        if var cache: MoviesResponse = localStorage.get(key: cacheKey) {
            if cache.results.contains(where: { $0.id == movie.id }) {
                cache.results.removeAll(where: { $0.id == movie.id })
                localStorage.save(object: cache, key: cacheKey)
                executeDislike()
                return
            }
            cache.results.append(movie)
            localStorage.save(object: cache, key: cacheKey)
        } else {
            let newCache = MoviesResponse(results: [movie])
            localStorage.save(object: newCache, key: cacheKey)
        }
    }
}
