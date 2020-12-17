//
//  PhotosListAssemblyTests.swift
//  MVPFirstUnitTests
//
//  Created by Алексей on 17.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit
import XCTest
@testable import MVPFirst

class PhotosListAssemblyTests: XCTestCase {
    
    let vc: PhotosListViewController = {
        let vc = PhotosListAssembly.assembleScreen()
        return vc as! PhotosListViewController
    }()
    
    func testVCHavePresenter() {
        XCTAssertNotNil(vc.presenter)
    }
    
    func testPresenterHaveView() {
        XCTAssertNotNil(vc.presenter?.view)
    }
    
    func testPresenterHaveDao() {
        guard let presenter = vc.presenter as? PhotosListPresenter else {
            XCTFail()
            return
        }
        XCTAssertNotNil(presenter.photosDao)
    }
    
    func testPresenterHaveImageDownloader() {
        guard let presenter = vc.presenter as? PhotosListPresenter else {
            XCTFail()
            return
        }
        XCTAssertNotNil(presenter.imageDownloader)
    }
}
