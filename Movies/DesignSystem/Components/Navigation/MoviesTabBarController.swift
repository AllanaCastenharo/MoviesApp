//
//  MoviesTabBarController.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 01/12/23.
//

import Foundation
import UIKit

class MoviesTabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBar.tintColor = .black

        let item1 = MoviesNavigationController(rootViewController: MoviesListFactory.make())
        let icon1 = UITabBarItem(title: "Filmes", image: Asset.list.image,
                                 selectedImage: Asset.list.image)
        item1.tabBarItem = icon1
        
        let item2 = MoviesNavigationController(rootViewController: MoviesSearchFactory.make())
        let icon2 = UITabBarItem(title: "Buscar", image: Asset.search.image,
                                 selectedImage: Asset.search.image)
        item2.tabBarItem = icon2
        
        let item3 = MoviesNavigationController(rootViewController: MoviesListFactory.makeLikedMovies()) 
        let icon3 = UITabBarItem(title: "Favoritos", image: Asset.favorite.image,
                                 selectedImage: Asset.favorite.image)
        item3.tabBarItem = icon3
        
        let controllers = [item1, item2, item3]
        self.viewControllers = controllers
    }

    //Delegate methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true;
    }
}
