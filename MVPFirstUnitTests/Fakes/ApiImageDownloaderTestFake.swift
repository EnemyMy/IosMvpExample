//
//  ApiImageDownloaderTestFake.swift
//  MVPFirstUnitTests
//
//  Created by Алексей on 16.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit
@testable import MVPFirst

final class ApiImageDownloaderTestFake: ImageDownloader {
    
    func getImage(url: URL, completionHandler: @escaping (Result<(URL, UIImage), Error>) -> Void) {
        completionHandler(.success((url, #imageLiteral(resourceName: "fakeImage.jpg"))))
    }
}
