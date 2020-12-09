//
//  PostsDao.swift
//  MVPFirst
//
//  Created by Алексей on 08.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

class PhotosDao {
    
    let apiManager: NetworkingService
    
    init(apiManager: NetworkingService) {
        self.apiManager = apiManager
    }
    
    func getPhotosData(onComplete: @escaping ([Photo]) -> Void, onFailure: @escaping (Error) -> Void) {
        apiManager.makeRequest(url: Constants.photosDataURL, onComplete: { data in
            if let photo = ResponseDecoder<Photo>.decode(data: data) {
                onComplete([photo])
            } else if let photos = ResponseDecoder<[Photo]>.decode(data: data) {
                onComplete(photos)
            } else {
                onFailure(CodableError.decodingError)
            }
        }, onFailure: onFailure)
    }
}

extension PhotosDao {
    enum Constants {
        static let photosDataURL = URL(string: "https://jsonplaceholder.typicode.com/photos")!
    }
}
