//
//  MoviesInteractor.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 27/05/22.
//

import Foundation

open class MoviesInteractor <Presenter> {
    public let presenter: Presenter
    
    public init(presenter: Presenter) {
        self.presenter = presenter
    }
}
