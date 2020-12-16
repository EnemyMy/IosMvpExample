//
//  ApiImageDownloader.swift
//  MVPFirst
//
//  Created by Алексей on 08.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class ApiImageDownloader: ImageDownloader {
    
    let imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 40
        return cache
    }()
    
    func getImage(url: URL, completionHandler: @escaping (Result<(URL, UIImage), Error>) -> Void) {
        if let image = imageCache.object(forKey: url.absoluteString as NSString) {
            completionHandler(.success((url, image)))
        } else {
            let apiManager = ApiManager()
            apiManager.makeRequest(url: url, completionHandler: { result in
                switch result {
                case .success(let data):
                    guard let image = UIImage(data: data) else {
                        completionHandler(.failure(ImageDownloadError.wrongImageData))
                        return
                    }
                    self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                    completionHandler(.success((url, image)))
                case .failure(let error): completionHandler(.failure(error))
                }
            })
        }
    }
}

protocol ImageDownloader {
    func getImage(url: URL, completionHandler: @escaping (Result<(URL, UIImage), Error>) -> Void)
}
