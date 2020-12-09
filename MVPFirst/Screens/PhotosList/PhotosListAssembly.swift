//
//  PostsListAssembly.swift
//  MVPFirst
//
//  Created by Алексей on 08.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

enum PhotosListAssembly {
    static func assembleScreen() -> UIViewController {
        let networkingService = ApiManager()
        let imageDownloader = ApiImageDownloader()
        let dao = PhotosDao(apiManager: networkingService)
        let view = PhotosListViewController()
        let presenter = PhotosListPresenter(view: view)
        presenter.photosDao = dao
        presenter.imageDownloader = imageDownloader
        view.presenter = presenter
        return view
    }
}
