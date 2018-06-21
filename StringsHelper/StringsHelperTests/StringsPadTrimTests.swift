//
//  StringsPadTrimTests.swift
//  StringsHelperTests
//
//  Created by Sarah Reichelt on 20/6/18.
//  Copyright © 2018 TrozWare. All rights reserved.
//

import XCTest
@testable import StringsHelper_Mac

class StringsPadTrimTests: XCTestCase {

    var spacedString = ""
    var shortNum = ""
    var longNum = ""

    override func setUp() {
        super.setUp()

        spacedString = "   This   string    has lots of extras    spaces.   "
        shortNum = "123"
        longNum = "1234567890"
    }

    override func tearDown() {
        super.tearDown()
    }

    func testTrim() {
        XCTAssertEqual(spacedString.trim(), "This   string    has lots of extras    spaces.")
    }

    func testTrimExtraChars() {
        let startString = " $45.00 "
        let trimmedString = startString.trim(using: "$0.")
        XCTAssertEqual(trimmedString, "45")
    }

    func testTrimLeft() {
        XCTAssertEqual(spacedString.trimLeft(), "This   string    has lots of extras    spaces.   ")
    }

    func testTrimLeftExtraChars() {
        let startString = " $45.00 "
        let trimmedString = startString.trimLeft(using: "$0.")
        XCTAssertEqual(trimmedString, "45.00 ")
    }

    func testTrimRight() {
        XCTAssertEqual(spacedString.trimRight(), "   This   string    has lots of extras    spaces.")
    }

    func testTrimRightExtraChars() {
        let startString = " $45.00 "
        let trimmedString = startString.trimRight(using: "$0.")
        XCTAssertEqual(trimmedString, " $45")
    }

    func testPadLeft() {
        XCTAssertEqual(shortNum.padLeft(to: 4), "123 ")
        XCTAssertEqual(shortNum.padLeft(to: 6, with: "*"), "123***")
        XCTAssertEqual(longNum.padLeft(to: 6, with: "."), "123456")
    }

    func testPadRight() {
        XCTAssertEqual(shortNum.padRight(to: 4), " 123")
        XCTAssertEqual(shortNum.padRight(to: 6, with: "*"), "***123")
        XCTAssertEqual(longNum.padRight(to: 6, with: "."), "123456")
    }

}
