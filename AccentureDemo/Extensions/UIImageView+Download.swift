//
//  UIImageView+Download.swift
//  AccentureDemo
//
//  Created by Pradip Vanparia on 16/10/22.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {

    @discardableResult
    func setImageFromUrl(_ urlString: String) -> URLSessionDataTask?  {
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return nil
        }

        self.image = nil
        guard let url = URL(string: urlString) else {
            return nil
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                if let imageToCache = UIImage(data: data) {
                    imageCache.setObject(imageToCache, forKey: urlString as AnyObject)
                    self.image = imageToCache
                }
            }
        }
        task.resume()

        return task
    }
}
