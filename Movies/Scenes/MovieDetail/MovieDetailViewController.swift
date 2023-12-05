//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 28/11/23.
//

import UIKit

final class MovieDetailViewController: MoviesViewController<MovieDetailInteracting> {
    func downloadImage(from url: URL?) {
        guard let url = url else {
            return
        }
        let chache = ImageCache()
        chache.getImage(from: url) { image, error in
            if let image = image {
                DispatchQueue.main.async {
                    self.imageMovie.image = image
                }
            }
        }
    }
    
    var imageMovie: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true

        return image
    }()
    
    lazy var titleLabel: MoviesLabel = {
        let label = MoviesLabel(fontSize: .title3, fontWeight: .bold, color: .primary)
        label.numberOfLines = 0
        label.text = interactor.model.title
        return label
    }()
    
    lazy var descriptionLabel: MoviesLabel = {
        let label = MoviesLabel(fontSize: .body1, fontWeight: .bold, color: .primary)
        label.numberOfLines = 0
        label.text = interactor.model.overview
        return label
    }()
    
    var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        downloadImage(from: URL(string: "https://image.tmdb.org/t/p/w500" + interactor.model.posterPath))
    }
}
extension MovieDetailViewController: ViewCode {
    func buildViewHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(imageMovie)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(descriptionLabel)
    }

    func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        imageMovie.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            imageMovie.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageMovie.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageMovie.topAnchor.constraint(equalTo: scrollView.topAnchor),

            titleLabel.topAnchor.constraint(equalTo: imageMovie.bottomAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -.moviesSpacing(.base02)),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .moviesSpacing(.base02)),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -.moviesSpacing(.base02))
        ])
    }
    
    func setupAdditionalConfiguration() {
        title = "Detalhes"
        view.backgroundColor = .moviesColor(.white)
    }
}

