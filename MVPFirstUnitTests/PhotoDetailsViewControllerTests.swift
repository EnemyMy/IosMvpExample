//
//  PhotoDetailsViewControllerTests.swift
//  MVPFirstUnitTests
//
//  Created by Алексей on 17.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit
import XCTest
@testable import MVPFirst

class PhotoDetailsViewControllerTests: XCTestCase {
    let vc: PhotoDetailsViewController = {
        let vc = PhotoDetailsViewController()
        let presenter = PhotoDetailsPresenter(view: vc)
        presenter.imageDownloader = ApiImageDownloaderTestFake()
        vc.presenter = presenter
        let photo = Photo(albumId: 1, id: 1, title: "TestTitle", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/150/92c952")
        vc.photoDetails = PhotoDetails(photo: photo)
        return vc
    }()
    
    func testActivityIndicatorStartsAnimating() {
        vc.startLoading()
        assert(vc.activityIndicator.isAnimating)
    }
    
    func testActivityIndicatorStopsAnimating() {
        vc.startLoading()
        vc.endLoading()
        assert(!vc.activityIndicator.isAnimating)
    }
}
