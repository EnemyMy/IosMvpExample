//
//  MVPFirstUnitTests.swift
//  MVPFirstUnitTests
//
//  Created by Алексей on 16.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import XCTest
@testable import MVPFirst

class ApiManagerTests: XCTestCase {
    
    var expectation: XCTestExpectation!
    let manager = ApiManager()
    
    override func setUp() {
        expectation = expectation(description: "Test pass its requirements")
    }

    func testSuccessResultWithCorrectURL() {
        manager.makeRequest(url: PhotosDao.Constants.photosDataURL) { result in
            switch result {
            case .failure(_): XCTFail()
            default: break
            }
            self.expectation.fulfill()
        }
        waitForExpectations(timeout: 3)
    }
    
    func testFailureResultWithIncorrectURL() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/phot") else {
            XCTFail()
            return
        }
        manager.makeRequest(url: url) { result in
            switch result {
            case .success(_): XCTFail()
            default: break
            }
            self.expectation.fulfill()
        }
        waitForExpectations(timeout: 3)
    }
}
