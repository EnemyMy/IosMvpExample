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
    
    func getImage(url: URL, onComplete: @escaping (URL, UIImage) -> Void, onFailure: @escaping (Error) -> Void) {
        if let image = imageCache.object(forKey: url.absoluteString as NSString) {
            onComplete(url, image)
        } else {
            let apiManager = ApiManager()
            apiManager.makeRequest(url: url, onComplete: { data in
                guard let image = UIImage(data: data) else {
                    onFailure(ImageDownloadError.wrongImageData)
                    return
                }
                self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                onComplete(url, image)
            }, onFailure: onFailure)
        }
    }
}
