//
//  MoviesListLikedService.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 02/12/23.
//

import Foundation

final class MoviesLikedService: MoviesListServicing {
    func fetch(completion: @escaping (Result<MoviesResponse, NetworkError>) -> Void) {
        if let data = UserDefaults.standard.object(forKey: "likedMovies") as? Data,
           let response = try? JSONDecoder().decode(MoviesResponse.self, from: data) {
            completion(.success(response))
        }
    }
    
    
    

}
