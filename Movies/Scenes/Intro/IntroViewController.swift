//
//  IntroViewController.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 27/05/22.
//

import UIKit

final class IntroViewController: MoviesViewController<IntroInteractorProtocol> {
    typealias Strings = Localization.Intro
    
    private var imageView: UIImageView = {
        let image = Asset.introImage.image
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var logo: UIImageView = {
        let image = Asset.logo.image
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private var titleLabel: MoviesLabel = {
        let fontSize: MoviesFontSize = UIScreen.main.sizeType == .iPhone5 ? .title1 : .title2
        let label = MoviesLabel(fontSize: fontSize, fontWeight: .bold, color: .white)
        label.text = Strings.titleLabel
        label.numberOfLines = 2
        return label
    }()
    
    private var descriptionLabel: MoviesLabel = {
        let label = MoviesLabel(fontSize: .body1, fontWeight: .bold, color: .white)
        label.text = Strings.descriptionLabel
        label.numberOfLines = .zero
        return label
    }()
    
    private lazy var buttonWelcome: MoviesButton = {
        let button = MoviesButton()
        button.render(.fill(.init(style: .primary(isLight: true), icon: nil, title: Strings.buttonWelcome)))
        button.addTarget(self, action: #selector(didTapButtonMovieList), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

extension IntroViewController: ViewCode {
    func buildViewHierarchy() {
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(buttonWelcome)
        view.addSubview(logo)
    }
    
    func setupConstraints() {
        logo.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonWelcome.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            /// Image Intro
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            
            /// Tiitle Intro
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.moviesSpacing(.base07)),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .moviesSpacing(.base07)),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -.moviesSpacing(.base05)),
            
            /// Description Intro
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.moviesSpacing(.base07)),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .moviesSpacing(.base07)),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .moviesSpacing(.base05)),
            
            /// Buttons
            buttonWelcome.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: .moviesSpacing(.base07)),
            buttonWelcome.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.moviesSpacing(.base07)),
            buttonWelcome.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .moviesSpacing(.base07)),
            buttonWelcome.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -.moviesSpacing(.base05)),
            
            /// Logo 
            logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .moviesSpacing(.base07)),
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .moviesSpacing(.base07)),
        ])
        
        imageView.setContentHuggingPriority(.defaultLow, for: .vertical)
        imageView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .moviesColor(.primary)
    }
}

@objc
extension IntroViewController {
    func didTapButtonMovieList() {
        interactor.openMovies()
    }
}
