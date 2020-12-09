//
//  PhotoListItem.swift
//  MVPFirst
//
//  Created by Алексей on 08.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

struct PhotoListItem {
    let title: String
    let thumbnailUrl: String
    
    init(photo: Photo) {
        title = photo.title
        thumbnailUrl = photo.thumbnailUrl
    }
}
