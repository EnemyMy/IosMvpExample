//
//  PhotoDetailsPresenterTests.swift
//  MVPFirstUnitTests
//
//  Created by Алексей on 17.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit
import XCTest
@testable import MVPFirst

class PhotoDetailsPresenterTests: XCTestCase {
    let presenter: PhotoDetailsPresenter = {
        let view = PhotoDetailsViewController()
        let presenter = PhotoDetailsPresenter(view: view)
        presenter.imageDownloader = ApiImageDownloaderTestFake()
        return presenter
    }()
    
    func testResultIsSuccessWithCorrectData() {
        presenter.getImage(url: "https://via.placeholder.com/600/92c952") { result in
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
    
    func testHandleFailurePerformingOnMainThread() {
        presenter.handleFailure {
            assert(Thread.isMainThread)
        }
    }
}
