//
//  Errors.swift
//  MVPFirst
//
//  Created by Алексей on 08.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case connectionError(Error)
    case wrongResponseType
    case wrongStatusCode(Int)
    case noData
}

enum CodableError: Error {
    case decodingError
}

enum ImageDownloadError: Error {
    case wrongImageData
}
