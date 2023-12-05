//
//  MoviesLabel.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 27/05/22.
//

import UIKit

final class MoviesLabel: UILabel {
    init(fontSize: MoviesFontSize, fontWeight: UIFont.Weight, color: MoviesColor) {
        super.init(frame: .zero)
        textColor = .moviesColor(color)
        font = .systemFont(ofSize: fontSize.rawValue, weight: fontWeight)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    func setColor(_ moviesColor: MoviesColor) {
        textColor = moviesColor.color()
    }
}
