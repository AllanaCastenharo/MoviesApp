//
//  MoviesListViewController.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 28/11/23.
//

import UIKit
import SwiftUI
protocol MovieListDisplaying: AnyObject {
    func updateView()
}

class MoviesListViewController: MoviesViewController<MoviesListInteracting> {
    typealias Strings = Localization.Intro
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MovieViewCell.self, forCellWithReuseIdentifier: String(describing: MovieViewCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    private var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width * 0.47,
                                 height: UIScreen.main.bounds.width * 0.7)
        layout.scrollDirection = .vertical
        return layout
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor.fetchData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Lista de Filmes"
    }
}

extension MoviesListViewController: ViewCode {
    func buildViewHierarchy() {
        view.addSubview(collectionView)
        
    }
    
    func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.title = "Lista de Filmes"
    }
    
}


extension MoviesListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interactor.model?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieViewCell", for: indexPath) as? MovieViewCell
        
        let isFavoriteMovie = interactor.isFavoriteMovie(index: indexPath.row)
        let url = interactor.model?.results[indexPath.row].posterPath ?? ""
        cell?.setup(
            isFavoriteMovie: isFavoriteMovie,
            url: url,
            description: interactor.model?.results[indexPath.row].title ?? String(),
            likedTapped: { [weak self] in
                guard let self = self else { return }
                self.interactor.saveLocalStorage(index: indexPath.row) {
                    cell?.deslike()
                }
            }
        )
        return cell ?? UICollectionViewCell()
        
    }

}

extension MoviesListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.interactor.openDetail(index: indexPath.row)
    }
}

extension MoviesListViewController: MovieListDisplaying {
    func updateView() {
        collectionView.reloadData()
    }
}

extension MoviesListViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > (contentHeight - scrollView.frame.size.height) - 60 {
            interactor.fetchData()
        }
    }
}
