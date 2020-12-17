//
//  ResponseDecoderTests.swift
//  MVPFirstUnitTests
//
//  Created by Алексей on 16.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation
import XCTest
@testable import MVPFirst

class ResponseDecoderTests: XCTestCase {
    
    func testDecodeFailsWithIncorrectData() {
        let result = ResponseDecoder<Photo>.decode(data: Data())
        XCTAssertNil(result)
    }
    
    func testDecodeReturnSingleItem() {
        guard let url = Bundle.main.url(forResource: "PhotoResponse", withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                XCTFail()
                return
        }
        let result = ResponseDecoder<Photo>.decode(data: data)
        XCTAssertNotNil(result)
    }
    
    func testDecodeReturnMultipleItems() {
        guard let url = Bundle.main.url(forResource: "PhotosResponse", withExtension: "json"),
        let data = try? Data(contentsOf: url) else {
            XCTFail()
            return
        }
        let result = ResponseDecoder<[Photo]>.decode(data: data)
        XCTAssertNotNil(result)
        assert(result!.count > 0)
    }
}
