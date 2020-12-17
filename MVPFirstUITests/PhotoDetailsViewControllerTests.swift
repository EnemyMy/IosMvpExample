//
//  PhotoDetailsViewControllerTests.swift
//  MVPFirstUITests
//
//  Created by Алексей on 17.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import XCTest

class PhotoDetailsViewControllerTests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }
    
    func testAlbumIdLabelExists() {
        sleep(3)
        app.staticTexts["accusamus beatae ad facilis cum similique qui sunt"].tap()
        assert(app.staticTexts["Album Id:"].exists)
    }
    
    func testIdLabelExists() {
        sleep(3)
        app.staticTexts["accusamus beatae ad facilis cum similique qui sunt"].tap()
        assert(app.staticTexts["Id:"].exists)
    }
    
    func testTitleLabelExists() {
        sleep(3)
        app.staticTexts["accusamus beatae ad facilis cum similique qui sunt"].tap()
        assert(app.staticTexts["Title:"].exists)
    }
    
    func testUrlLabelExists() {
        sleep(3)
        app.staticTexts["accusamus beatae ad facilis cum similique qui sunt"].tap()
        assert(app.staticTexts["Url:"].exists)
    }
}
