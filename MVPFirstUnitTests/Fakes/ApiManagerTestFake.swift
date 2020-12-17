//
//  ApiManagerTestFake.swift
//  MVPFirstUnitTests
//
//  Created by Алексей on 16.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation
@testable import MVPFirst

final class ApiManagerTestFake: NetworkingService {
    
    func makeRequest(url: URL, completionHandler: @escaping (Result<Data, Error>) -> Void) {
        guard let url = Bundle.main.url(forResource: "PhotosResponse", withExtension: "json"),
            let data = try? Data(contentsOf: url) else { return }
        completionHandler(.success(data))
    }
}
