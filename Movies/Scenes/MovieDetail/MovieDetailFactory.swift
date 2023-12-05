//
//  MovieDetailFactory.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 28/11/23.
//


import UIKit

public struct MovieDetailFactory {
    static func make(model: MoviesModel) -> UIViewController {
        let interactor = MovieDetailInteractor(model: model)
        let viewController = MovieDetailViewController(interactor: interactor)
        
        viewController.hidesBottomBarWhenPushed = true
        return viewController
    }
}
