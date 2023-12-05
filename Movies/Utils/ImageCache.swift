//
//  ImageCache.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 01/12/23.
//

import Foundation
import UIKit

class ImageCache {
        
    static let shared = NSCache<NSString, UIImage>()
    
    func getImage(from url: URL, completion: @escaping ((UIImage?, Error?)->(Void))) {
        if let cachedImage = ImageCache.shared.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage, nil)
        }
        
        downloadImage(from: url) { (callback) in
            switch callback {
            case .success(let image):
                ImageCache.shared.setObject(image, forKey: url.absoluteString as NSString)
                completion(image, nil)
            case .failure(let error):
                completion(nil, error)

            }
            
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL?, completion: @escaping (Result<UIImage, Error>) -> ()) {
        guard let url = url else {
            return
        }
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else {
                
                return
            }
            
            completion(.success(UIImage(data: data)!))
        }
    }
}
