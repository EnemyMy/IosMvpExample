//
//  ImageDownloader.swift
//  MVPFirst
//
//  Created by Алексей on 08.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

protocol ImageDownloader {
    func getImage(url: URL, completionHandler: @escaping (Result<(URL, UIImage), Error>) -> Void)
}
