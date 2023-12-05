//
//  MoviesSearchViewController.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 27/05/22.
//

import UIKit

final class MoviesSearchViewController: MoviesViewController<MoviesSearchInteracting> {
    
    private var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "Busque um filme"
        return search
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension MoviesSearchViewController: ViewCode {
    func buildViewHierarchy() {
        view.addSubview(searchBar)
    }
    
    func setupConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            searchBar.rightAnchor.constraint(equalTo: view.rightAnchor)


        ])
        
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .moviesColor(.white)
    }
}

@objc
extension MoviesSearchViewController {
    func didTapSearchMovieList() {
        interactor.openSearchMovies()
    }
}
