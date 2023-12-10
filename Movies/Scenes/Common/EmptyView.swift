//
//  EmptyView.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 10/12/23.
//

import Foundation
import UIKit

final class EmptyView: UIView {
    
    var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Não há nenhum filme por aqui"
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupView()
    }
    
    func showView(view: UIView) {
        setupView()

        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor)

        ])
        backgroundColor = .moviesColor(.white)
        view.bringSubviewToFront(self)
    }
    
    func hiddenView() {
        removeFromSuperview()
    }
}

extension EmptyView: ViewCode {
    func buildViewHierarchy() {
        addSubview(textLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
