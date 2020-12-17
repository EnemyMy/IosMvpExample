//
//  PhotosDaoTests.swift
//  MVPFirstUnitTests
//
//  Created by Алексей on 17.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation
import XCTest
@testable import MVPFirst

class PhotosDaoTests: XCTestCase {
    
    func testResultCountIsTen() {
        let apiManagerFake = ApiManagerTestFake()
        let dao = PhotosDao(apiManager: apiManagerFake)
        dao.getPhotosData { result in
            switch result {
            case .failure(_): XCTFail()
            case .success(let photos):assert(photos.count == 10)
            }
        }
    }
}
