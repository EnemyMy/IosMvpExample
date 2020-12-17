//
//  PhotosListPresenterTests.swift
//  MVPFirstUnitTests
//
//  Created by Алексей on 17.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit
import XCTest
@testable import MVPFirst

class PhotosListPresenterTests: XCTestCase {
    let presenter: PhotosListPresenter = {
        let view = PhotosListViewController()
        let presenter = PhotosListPresenter(view: view)
        presenter.photosDao = PhotosDao(apiManager: ApiManagerTestFake())
        presenter.imageDownloader = ApiImageDownloaderTestFake()
        return presenter
    }()
    
    func testResultIsSuccessWithCorrectData() {
        presenter.getImage(url: "https://via.placeholder.com/150/92c952") { result in
            switch result {
            case .failure(_): XCTFail()
            default: break
            }
        }
    }
    
    func testHandleSuccessPerformingOnMainThread() {
        presenter.handleSuccess {
            assert(Thread.isMainThread)
        }
    }
}
