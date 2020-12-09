//
//  PhotoDetails.swift
//  MVPFirst
//
//  Created by Алексей on 09.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

struct PhotoDetails {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
    
    init(photo: Photo) {
        albumId = photo.albumId
        id = photo.id
        title = photo.title
        url = photo.url
        thumbnailUrl = photo.thumbnailUrl
    }
}
