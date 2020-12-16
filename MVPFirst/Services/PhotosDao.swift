//
//  PostsDao.swift
//  MVPFirst
//
//  Created by Алексей on 08.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

final class PhotosDao {
    
    let apiManager: NetworkingService
    
    init(apiManager: NetworkingService) {
        self.apiManager = apiManager
    }
    
    func getPhotosData(completionHandler: @escaping (Result<[Photo], Error>) -> Void) {
        apiManager.makeRequest(url: Constants.photosDataURL) { result in
            switch result {
            case .success(let data):
                if let photo = ResponseDecoder<Photo>.decode(data: data) {
                    completionHandler(.success([photo]))
                } else if let photos = ResponseDecoder<[Photo]>.decode(data: data) {
                    completionHandler(.success(photos))
                } else {
                    completionHandler(.failure(CodableError.decodingError))
                }
            case .failure(let error): completionHandler(.failure(error))
            }
        }
    }
}

extension PhotosDao {
    enum Constants {
        static let photosDataURL = URL(string: "https://jsonplaceholder.typicode.com/photos")!
    }
}
