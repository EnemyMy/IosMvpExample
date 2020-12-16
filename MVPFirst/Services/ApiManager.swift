//
//  PostsApi.swift
//  MVPFirst
//
//  Created by Алексей on 08.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class ApiManager: NetworkingService {
    
    func makeRequest(url: URL, completionHandler: @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completionHandler(.failure(NetworkError.connectionError(error)))
                return
            } else {
                guard let response = response as? HTTPURLResponse else {
                    completionHandler(.failure(NetworkError.wrongResponseType))
                    return
                }
                guard (200..<300).contains(response.statusCode) else {
                    completionHandler(.failure(NetworkError.wrongStatusCode(response.statusCode)))
                    return
                }
                guard let data = data else {
                    completionHandler(.failure(NetworkError.noData))
                    return
                }
                DispatchQueue.main.async { completionHandler(.success(data)) }
            }
        }.resume()
    }
}
