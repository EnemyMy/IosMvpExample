//
//  PhotoListViewControllerTests.swift
//  MVPFirstUnitTests
//
//  Created by Алексей on 17.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit
import XCTest
@testable import MVPFirst

class PhotosListViewControllerTests: XCTestCase {
    
    let vc: PhotosListViewController = {
        let vc = PhotosListViewController()
        vc.items = [
            PhotoListItem(photo: Photo(albumId: 1, id: 1, title: "TestTitle1", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/150/92c952")),
            PhotoListItem(photo: Photo(albumId: 1, id: 2, title: "TestTitle2", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/150/92c952"))
        ]
        let presenter = PhotosListPresenter(view: vc)
        presenter.imageDownloader = ApiImageDownloaderTestFake()
        presenter.photosDao = PhotosDao(apiManager: ApiManagerTestFake())
        vc.presenter = presenter
        return vc
    }()
    
    func testActivityIndicatorStartsAnimating() {
        vc.startLoading()
        assert(vc.indicatorView.isAnimating)
    }
    
    func testActivityIndicatorStopsAnimating() {
        vc.startLoading()
        vc.endLoading()
        assert(!vc.indicatorView.isAnimating)
    }
    
    func testRowIsSelected() {
        vc.selectRow(at: IndexPath(row: 0, section: 0))
        assert(vc.tableView.indexPathForSelectedRow == IndexPath(row: 0, section: 0))
    }
    
    func testRowIsUnselected() {
        vc.selectRow(at: IndexPath(row: 0, section: 0))
        vc.deselectRow(at: IndexPath(row: 0, section: 0))
        XCTAssertNil(vc.tableView.indexPathForSelectedRow)
    }
}
