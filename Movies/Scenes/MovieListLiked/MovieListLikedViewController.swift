//
//  MovieListLikedViewController.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 02/12/23.
//

import UIKit

final class MoviesListLikedViewController: MoviesListViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor.fetchData()
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {}
}
