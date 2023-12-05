//
//  UIImage+Utils.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 28/05/22.
//

import UIKit

extension UIImage {
    
    public func paintImage(color: MoviesColor) -> UIImage? {
        var tempImage: UIImage?
        tempImage = withTintColor(.moviesColor(color))
        return tempImage
    }
    
}

extension UIImageView {
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }
}
