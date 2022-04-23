//
//  UIImageViewExtension.swift
//  DogCeoChallenge
//
//  Created by Mobdev on 22-04-22.
//

import UIKit

var nsCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  let image = UIImage(data: data) else {
                return
            }
            nsCache.setObject(image, forKey: url.absoluteString as NSString)
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else {
            return
        }
        downloaded(from: url, contentMode: mode)
    }
    
}
