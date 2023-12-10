//
//  MoviesListService.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 28/11/23.
//

import Foundation

protocol MoviesListServiceProtocol: AnyObject {
    func fetch(page: Int , completion: @escaping (Result<MoviesResponse, NetworkError>) -> Void)
    func fetch(search: String, page: Int, completion: @escaping (Result<MoviesResponse, NetworkError>) -> Void)
}

extension MoviesListServiceProtocol {
    func fetch(search: String, page: Int, completion: @escaping (Result<MoviesResponse, NetworkError>) -> Void) {}
    func fetch(page: Int, completion: @escaping (Result<MoviesResponse, NetworkError>) -> Void) {}
}

final class MoviesListService: MoviesListServiceProtocol {    
    func fetch(page: Int, completion: @escaping (Result<MoviesResponse, NetworkError>) -> Void) {
        let request = MovieListRequest(page: page)
        NetworkSession.shared.request(request: request) { (result: Result<MoviesResponse?, NetworkError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    guard let model = model else {
                        completion(.failure(.unknown))
                        return
                    }
                    completion(.success(model))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}

class MovieListRequest: NetworkRequestProtocol {
    var baseURL: String {
        "https://api.themoviedb.org"
    }
    var path: String {
        "/3/movie/popular?language=pt-BR&page=\(page)&api_key=dec91e4ff4c07896d52fb093225b685f"
    }
    
    var method: HTTPMethod {
        .get
    }
    var headers: [String: String]?
    var parameters: [String: Any]?
    
    let page: Int
    
    init(page: Int) {
        self.page = page
    }
}
