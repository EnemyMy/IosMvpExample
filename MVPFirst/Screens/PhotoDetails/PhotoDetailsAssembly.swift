//
//  PhotoDetailsAssembly.swift
//  MVPFirst
//
//  Created by Алексей on 09.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

enum PhotoDetailsAssembly {
    static func assemble(details: PhotoDetails) -> UIViewController {
        let imageDownloader = ApiImageDownloader()
        let view = PhotoDetailsViewController()
        view.photoDetails = details
        let presenter = PhotoDetailsPresenter(view: view)
        presenter.imageDownloader = imageDownloader
        view.presenter = presenter
        return view
    }
}
