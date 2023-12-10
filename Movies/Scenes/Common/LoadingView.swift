//
//  LoadingView.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 10/12/23.
//

import Foundation
import UIKit

final class LoadingView: UIView {
    
    var loading: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView(style: .large)
        loading.translatesAutoresizingMaskIntoConstraints = false
        loading.startAnimating()
        
        return loading
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupView()
    }
    
    func startLoading(view: UIView) {
        setupView()

        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor)

        ])
        backgroundColor = .moviesColor(.offBlack).withAlphaComponent(0.4)

        view.bringSubviewToFront(self)
    }
    
    func startTinyLoading(view: UIView) {
//        setupView()
//
//        view.addSubview(self)
//        translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            heightAnchor.constraint(equalToConstant: 200.0),
//            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            trailingAnchor.constraint(equalTo: view.trailingAnchor)
//
//        ])
//        backgroundColor = .white
//
//        view.bringSubviewToFront(self)
    }
    
    func stopLoading() {
        removeFromSuperview()
    }
}

extension LoadingView: ViewCode {
    func buildViewHierarchy() {
        addSubview(loading)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            loading.centerXAnchor.constraint(equalTo: centerXAnchor),
            loading.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
