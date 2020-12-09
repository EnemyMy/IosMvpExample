//
//  PostsApi.swift
//  MVPFirst
//
//  Created by Алексей on 08.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class ApiManager: NetworkingService {
    
    func makeRequest(url: URL, onComplete: @escaping (Data) -> Void, onFailure: @escaping (Error) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                onFailure(NetworkError.connectionError(error))
                return
            } else {
                guard let response = response as? HTTPURLResponse else {
                    onFailure(NetworkError.wrongResponseType)
                    return
                }
                guard (200..<300).contains(response.statusCode) else {
                    onFailure(NetworkError.wrongStatusCode(response.statusCode))
                    return
                }
                guard let data = data else {
                    onFailure(NetworkError.noData)
                    return
                }
                DispatchQueue.main.async { onComplete(data) }
            }
        }.resume()
    }
}
