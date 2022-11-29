//
//  UIImageView+Extension.swift
//  Sepia Pets
//
//  Created by Sanoop PM on 30/11/22.
//

import UIKit


// extension to load image from remote url
extension UIImageView {
    func load(url: URL) {
        let cache = URLCache.shared
        let request = URLRequest(url: url)
                
        if let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
            DispatchQueue.main.async {
                    self.image = image
            }
        } else {
                    
            URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            guard let data = data, let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode, let image = UIImage(data: data) else { return }
                        
            let cachedData = CachedURLResponse(response: httpResponse, data: data)
            cache.storeCachedResponse(cachedData, for: request)
            DispatchQueue.main.async {
                self?.image = image
                        }
            }.resume()
        }
    }
}
