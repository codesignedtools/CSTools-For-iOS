//
//  CSImageView.swift
//  CodeSigned
//
//  Created by Rodney Gainous Jr on 6/12/19.
//  Copyright © 2019 CodeSigned. All rights reserved.
//

import UIKit

var imageCache = [String : UIImage]()

class CSImageView: UIImageView {

    private var lastURLUsedToLoadImage: String?

    func loadImage(urlString: String) {
        lastURLUsedToLoadImage = urlString
        image = nil

        if let cachedImage = imageCache[urlString] {
            image = cachedImage
            return
        }

        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                print("Failed to load image:", err)
                return
            }

            if url.absoluteString != self.lastURLUsedToLoadImage { return }

            guard let imageData = data else { return }

            let photoImage = UIImage(data: imageData)
            imageCache[url.absoluteString] = photoImage

            DispatchQueue.main.async {
                self.image = photoImage
            }
        }.resume()
    }
}
