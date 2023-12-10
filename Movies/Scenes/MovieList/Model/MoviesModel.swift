//
//  MoviesListModel.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 29/11/23.
//

struct MoviesResponse: Codable {
    var results: [MoviesModel]
}

struct MoviesModel: Codable, Equatable {
    var id: Int
    var title: String?
    var name: String?
    var overview: String
    var popularity: Double?
    var posterPath: String?
}
