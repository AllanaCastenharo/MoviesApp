//
//  IntroCoordinator.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 27/05/22.
//

import UIKit

protocol IntroCoordinatorProtocol: AnyObject {
    func showMovies()
}

final class IntroCoordinator {
    weak var viewController: UIViewController?
}

extension IntroCoordinator: IntroCoordinatorProtocol {
    func showMovies() {
        let tabbar = MoviesTabBarController()
        viewController?.navigationController?.pushViewController(tabbar, animated: true)
    }
}
