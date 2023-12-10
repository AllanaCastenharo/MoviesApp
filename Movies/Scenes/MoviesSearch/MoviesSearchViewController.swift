//
//  MoviesSearchViewController.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 27/05/22.
//

import UIKit

import UIKit

final class MoviesSearchViewController: MoviesListViewController {

    private var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "Busque um filme"
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()

    override func viewDidLoad() {
        searchBar.delegate = self
        setupView()
    }

    override func viewDidAppear(_ animated: Bool) {
        title = "Busca"
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {}
}

extension MoviesSearchViewController {
    override func buildViewHierarchy() {
        super.buildViewHierarchy()
        view.addSubview(searchBar)
    }

    override func setupConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            container.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            collectionView.topAnchor.constraint(equalTo: container.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
    }

    override func setupAdditionalConfiguration() {
        title = "Busca"
        view.backgroundColor = .moviesColor(.white)
    }
}

extension MoviesSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        interactor.fetchData(searchText: searchBar.text)
        view.endEditing(true)
    }
}
