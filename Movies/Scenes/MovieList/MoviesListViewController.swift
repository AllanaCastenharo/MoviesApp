//
//  MoviesListViewController.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 28/11/23.
//

import UIKit
import SwiftUI
protocol MovieListViewControllerProcotol: AnyObject {
    func updateView()
    func updateNewItems(indexPaths: [IndexPath])
    func startLoading()
    func stopLoading()
}

class MoviesListViewController: MoviesViewController<MoviesListInteractorProtocol> {
    typealias Strings = Localization.Intro
    var indexLoaded = 0

    var loadingView: LoadingView?
    
    var emptyView: EmptyView = {
        let emptyView = EmptyView()
        return emptyView
    }()
    
    var container: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MovieViewCell.self, forCellWithReuseIdentifier: String(describing: MovieViewCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
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
    @objc 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        interactor.fetchData(searchText: nil)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Lista de Filmes"
    }
}

@objc extension MoviesListViewController: ViewCode {
    func buildViewHierarchy() {
        container.addSubview(collectionView)
        view.addSubview(container)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            collectionView.topAnchor.constraint(equalTo: container.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
        
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
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
        let title = interactor.model?.results[indexPath.row].title ??
            interactor.model?.results[indexPath.row].name
        cell?.setup(
            shouldReuse: indexLoaded > indexPath.row,
            isFavoriteMovie: isFavoriteMovie,
            url: url,
            description:  title ?? String(),
            likedTapped: { [weak self] in
                guard let self = self else { return }
                self.interactor.saveLocalStorage(index: indexPath.row) {
                    cell?.deslike()
                }
            }
        )
        indexLoaded = indexPath.row
        return cell ?? UICollectionViewCell()
        
    }

}

extension MoviesListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.interactor.openDetail(index: indexPath.row)
    }
}

extension MoviesListViewController: MovieListViewControllerProcotol {

    func startLoading() {
        loadingView = LoadingView()
        if interactor.model == nil {
            loadingView?.startLoading(view: view)
        } else {
            loadingView?.startTinyLoading(view: view)
        }
    }
    
    func stopLoading() {
        loadingView?.stopLoading()
    }
    
    func updateView() {
        if interactor.model?.results.isEmpty == true {
            emptyView.showView(view: container)
            return
        }
        
        emptyView.hiddenView()
        collectionView.reloadData()
    }
    
    func updateNewItems(indexPaths: [IndexPath]) {
        collectionView.insertItems(at: indexPaths)
    }
}

extension MoviesListViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > (contentHeight - scrollView.frame.size.height) - 60 {
            interactor.fetchData(searchText: nil)
        }
    }
}
