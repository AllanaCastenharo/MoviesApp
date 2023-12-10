//
//  MoviesListInteractor.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 04/12/23.
//

import Foundation

protocol MoviesListInteractorProtocol: AnyObject {
    var model: MoviesResponse? { get }
    func openDetail(index: Int)
    func fetchData(searchText: String?)
    func saveLocalStorage(index: Int, executeDislike: @escaping () -> Void)
    func isFavoriteMovie(index: Int) -> Bool
}

class MoviesListInteractor: MoviesInteractor<MoviesListPresenterProtocol> {
    var service: MoviesListServiceProtocol
    var localStorage: LocalStorageProtocol
    var model: MoviesResponse?
    let cacheKey = "moviesLocalStorage"
    var page = 1
    var shouldFetch = true
    
    init(service: MoviesListServiceProtocol, presenter: MoviesListPresenterProtocol, localStorage: LocalStorageProtocol) {
        self.service = service
        self.localStorage = localStorage
        super.init(presenter: presenter)
    }
}

extension MoviesListInteractor: MoviesListInteractorProtocol {
    func openDetail(index: Int) {
        guard let movie = model?.results[index] else {
            return
        }
        
        presenter.presentMoviesDetail(model: movie)
    }
    
    @objc func fetchData(searchText: String?) {
        guard shouldFetch else {
            return
        }
        
        shouldFetch = false
        
        presenter.startLoading()
        
        service.fetch(page: page) { [weak self] result in
            self?.presenter.stopLoading()
            switch result {
            case .success(let response):
                if self?.model == nil {
                    self?.model = response
                    self?.presenter.updateView()

                } else {
                    var loadedItems = self?.model?.results.count ?? 0
                    let indexPaths: [IndexPath] = response.results.compactMap {_ in
                        let indexPath = IndexPath(row: loadedItems, section: 0)
                        loadedItems += 1
                        return indexPath
                    }
                    self?.model?.results.append(contentsOf: response.results)
                    

                    self?.presenter.updateNewItems(indexPaths: indexPaths)
                }
                self?.page += 1
                self?.shouldFetch = true
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
