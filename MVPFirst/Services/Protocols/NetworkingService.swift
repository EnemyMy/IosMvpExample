//
//  NetworkingService.swift
//  MVPFirst
//
//  Created by Алексей on 08.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

protocol NetworkingService {
    func makeRequest(url: URL, completionHandler: @escaping (Result<Data, Error>) -> Void)
}
