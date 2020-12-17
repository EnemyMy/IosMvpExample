//
//  ApiImageDownloaderTests.swift
//  MVPFirstUnitTests
//
//  Created by Алексей on 16.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation
import XCTest
@testable import MVPFirst

class ApiImageDownloaderTests: XCTestCase {
    
    var expectation: XCTestExpectation!
    let imageDownloader = ApiImageDownloader()
    
    override func setUp() {
        expectation = expectation(description: "Test pass its requirements")
    }
    
    func testSuccessResultWithCorrectURL() {
        guard let url = URL(string: "https://via.placeholder.com/600/92c952") else {
            XCTFail()
            return
        }
        imageDownloader.getImage(url: url) { result in
            switch result {
            case .failure(_): XCTFail()
            default: break
            }
            self.expectation.fulfill()
        }
        waitForExpectations(timeout: 3)
    }
    
    func testFailureResultWithIncorrectURL() {
        guard let url = URL(string: "https://wrongUrl.com/600/92c952") else {
            XCTFail()
            return
        }
        imageDownloader.getImage(url: url) { result in
            switch result {
            case .success(_): XCTFail()
            default: break
            }
            self.expectation.fulfill()
        }
        waitForExpectations(timeout: 3)
    }
}
