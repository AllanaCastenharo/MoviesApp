//
//  MoviesNavigation.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 28/05/22.
//

import UIKit

open class MoviesNavigationController: UINavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }

    private func setupNavigation() {
        navigationBar.tintColor = .black;
        navigationItem.largeTitleDisplayMode = .never
    }
}

extension UINavigationController {
    func hideHairline() {
        if let hairline = findHairlineImageViewUnder(navigationBar) {
            hairline.isHidden = true
        }
    }
    func restoreHairline() {
        if let hairline = findHairlineImageViewUnder(navigationBar) {
            hairline.isHidden = false
        }
    }
    func findHairlineImageViewUnder(_ view: UIView) -> UIImageView? {
        if view is UIImageView && view.bounds.size.height <= 1.0 {
            return view as? UIImageView
        }
        for subview in view.subviews {
            if let imageView = self.findHairlineImageViewUnder(subview) {
                return imageView
            }
        }
        return nil
    }
}
