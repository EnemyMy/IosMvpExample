//
//  PostsDecoder.swift
//  MVPFirst
//
//  Created by Алексей on 08.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

enum ResponseDecoder<T:Decodable> {
    static func decode(data: Data) -> T? {
        let jsonDecoder = JSONDecoder()
        return try? jsonDecoder.decode(T.self, from: data)
    }
}
