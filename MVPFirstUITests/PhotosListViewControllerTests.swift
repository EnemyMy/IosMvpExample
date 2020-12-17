//
//  MVPFirstUITests.swift
//  MVPFirstUITests
//
//  Created by Алексей on 17.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import XCTest

class PhotosListViewCOntrollerTests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        app = XCUIApplication()
        app.launch()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTableLoadsCorrectly() throws {
        sleep(3)
        assert(app.staticTexts["accusamus beatae ad facilis cum similique qui sunt"].exists)
    }
    
    func testNavigationToDetails() {
        sleep(3)
        app.staticTexts["accusamus beatae ad facilis cum similique qui sunt"].tap()
        assert(app.images["Photo"].exists)
    }
}
