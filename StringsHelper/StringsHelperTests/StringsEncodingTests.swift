//
//  StringsEncodingTests.swift
//  StringsHelperTests
//
//  Created by Sarah Reichelt on 20/6/18.
//  Copyright © 2018 TrozWare. All rights reserved.
//

import XCTest
@testable import StringsHelper_Mac

class StringsEncodingTests: XCTestCase {

    var sampleNums = ""
    var sampleText = ""
    var multiLine = ""

    override func setUp() {
        super.setUp()

        sampleNums = "0123456789abcdef"
        sampleText = "To bé or not 👩‍👩‍👧‍👧 be, that is the question."
        multiLine = """
        Here is a string.
        It has more than one line.
        And it even contains "quotes".
        """
    }

    override func tearDown() {
        super.tearDown()
    }

    func testEncodeDecodeDefault() {
        guard let encode = sampleText.urlEncode() else {
            XCTFail("Unable to encode sampleText")
            return
        }
        XCTAssertEqual(encode, "To%20b%C3%A9%20or%20not%20%F0%9F%91%A9%E2%80%8D%F0%9F%91%A9%E2%80%8D%F0%9F%91%A7%E2%80%8D%F0%9F%91%A7%20be%2C%20that%20is%20the%20question.")
        let decode = encode.urlDecode()
        XCTAssertEqual(decode, sampleText)
    }

    func testEncodeDecodeQuery() {
        guard let encode = sampleText.urlEncode(for: .query) else {
            XCTFail("Unable to encode sampleText for query")
            return
        }
        XCTAssertEqual(encode, "To%20b%C3%A9%20or%20not%20%F0%9F%91%A9%E2%80%8D%F0%9F%91%A9%E2%80%8D%F0%9F%91%A7%E2%80%8D%F0%9F%91%A7%20be%2C%20that%20is%20the%20question.")
        let decode = encode.urlDecode(for: .query)
        XCTAssertEqual(decode, sampleText)
    }

    func testEncodeDecodeForm() {
        guard let encode = sampleText.urlEncode(for: .form) else {
            XCTFail("Unable to encode sampleText for form")
            return
        }
        XCTAssertEqual(encode, "To+b%C3%A9+or+not+%F0%9F%91%A9%E2%80%8D%F0%9F%91%A9%E2%80%8D%F0%9F%91%A7%E2%80%8D%F0%9F%91%A7+be%2C+that+is+the+question.")
        let decode = encode.urlDecode(for: .form)
        XCTAssertEqual(decode, sampleText)
    }

    func testBase64() {
        guard let base64 = sampleText.base64Encode() else {
            XCTFail("Unable to base64 encode sampleText")
            return
        }

        let plainText = base64.base64Decode()
        XCTAssertEqual(plainText, sampleText)
    }

    func testBase64_76chars() {
        guard let base64 = sampleText.base64Encode(lineLength: 76) else {
            XCTFail("Unable to base64 encode sampleText")
            return
        }

        let plainText = base64.base64Decode()
        XCTAssertEqual(plainText, sampleText)
    }

}
