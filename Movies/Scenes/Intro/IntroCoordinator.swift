//
//  IntroCoordinator.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 27/05/22.
//

import UIKit

protocol IntroCoordinating: AnyObject {
    func showMovies()
}

final class IntroCoordinator {
    weak var viewController: UIViewController?
}

extension IntroCoordinator: IntroCoordinating {
    func showMovies() {
        let tabbar = MoviesTabBarController()
        viewController?.navigationController?.pushViewController(tabbar, animated: true)
    }
}
