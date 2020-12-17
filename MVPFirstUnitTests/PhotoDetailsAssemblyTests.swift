//
//  PhotoDetailsAssemblyTests.swift
//  MVPFirstUnitTests
//
//  Created by Алексей on 17.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation
import XCTest
@testable import MVPFirst

class PhotoDetailsAssemblyTests: XCTestCase {
    
    let vc: PhotoDetailsViewController = {
        let photo = Photo(albumId: 1, id: 1, title: "TestTitle", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/150/92c952")
        let vc = PhotoDetailsAssembly.assemble(details: PhotoDetails(photo: photo))
        return vc as! PhotoDetailsViewController
    }()
    
    func testVCHavePresenter() {
        XCTAssertNotNil(vc.presenter)
    }
    
    func testVCHavePhotoDetails() {
        XCTAssertNotNil(vc.photoDetails)
    }
    
    func testPresenterHaveView() {
        XCTAssertNotNil(vc.presenter?.view)
    }
    
    func testPresenterHaveImageDownloader() {
        guard let presenter = vc.presenter as? PhotoDetailsPresenter else {
            XCTFail()
            return
        }
        XCTAssertNotNil(presenter.imageDownloader)
    }
}
