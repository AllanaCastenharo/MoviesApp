//
//  MoviesSearchService.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 07/12/23.
//

import Foundation

final class MoviesSearchService: MoviesListServiceProtocol {
    func fetch(search: String, page: Int, completion: @escaping (Result<MoviesResponse, NetworkError>) -> Void) {
        let request = MovieSearchRequest(page: page, searchText: search)
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

struct MovieSearchRequest: NetworkRequestProtocol {
    var baseURL: String {
        "https://api.themoviedb.org"
    }
    var path: String {
        "/3/search/collection?query=\(searchText)&include_adult=false&language=pt-BRS&api_key=dec91e4ff4c07896d52fb093225b685f"
    }
    
    var method: HTTPMethod {
        .get
    }
    var headers: [String: String]?
    var parameters: [String: Any]?
    
    let searchText: String

    let page: Int
    
    init(page: Int, searchText: String) {
        self.page = page
        self.searchText = searchText
    }
}
