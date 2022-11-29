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
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
