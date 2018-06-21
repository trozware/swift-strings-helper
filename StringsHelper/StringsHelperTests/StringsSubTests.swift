//
//  StringsSubTests.swift
//  StringsHelperTests
//
//  Created by Sarah Reichelt on 20/6/18.
//  Copyright © 2018 TrozWare. All rights reserved.
//

import XCTest
@testable import StringsHelper_Mac

class StringsSubTests: XCTestCase {

    var sampleNums = ""
    var sampleText = ""

    override func setUp() {
        super.setUp()

        sampleNums = "0123456789abcdef"
        sampleText = "To bé or not 👩‍👩‍👧‍👧 be, that is the question."
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSubStringFromNumber() {
        XCTAssertEqual(sampleNums.sub(from: 9), "9abcdef")
        XCTAssertEqual(sampleNums.sub(from: -3), "def")
        XCTAssertEqual(sampleNums.sub(from: 100), "")
        XCTAssertEqual(sampleNums.sub(from: -100), sampleNums)
    }

    func testSubStringUpToNumber() {
        XCTAssertEqual(sampleNums.sub(upTo: 4), "0123")
        XCTAssertEqual(sampleNums.sub(upTo: -3), "0123456789abc")
        XCTAssertEqual(sampleNums.sub(upTo: 100), sampleNums)
        XCTAssertEqual(sampleNums.sub(upTo: -100), "")
    }

    func testSubStringFromUpToNumber() {
        XCTAssertEqual(sampleNums.sub(from: 3, upTo: 7), "3456")
        XCTAssertEqual(sampleNums.sub(from: 3, upTo: -5), "3456789a")
        XCTAssertEqual(sampleNums.sub(from: 3, upTo: -50), "")
        XCTAssertEqual(sampleNums.sub(from: 100, upTo: 110), "")
        XCTAssertEqual(sampleNums.sub(from: 100, upTo: 3), "")
    }

    func testSubStringFromText() {
        XCTAssertEqual(sampleText.sub(from: "ques"), "question.")
        XCTAssertEqual(sampleText.sub(from: "👩‍👩‍👧‍👧"), "👩‍👩‍👧‍👧 be, that is the question.")
        XCTAssertEqual(sampleText.sub(from: "abc"), "")
    }

    func testSubStringUpToText() {
        XCTAssertEqual(sampleText.sub(upTo: "ques"), "To bé or not 👩‍👩‍👧‍👧 be, that is the ")
        XCTAssertEqual(sampleText.sub(upTo: "👩‍👩‍👧‍👧"), "To bé or not ")
        XCTAssertEqual(sampleText.sub(upTo: "abc"), sampleText)
    }

    func testSubStringFromUpToText() {
        XCTAssertEqual(sampleText.sub(from: "that", upTo: " que"), "that is the")
        XCTAssertEqual(sampleText.sub(from: "abc", upTo: " que"), "")
        XCTAssertEqual(sampleText.sub(from: "be", upTo: "xyz"), "be, that is the question.")
    }

    func testPositionOfText() {
        XCTAssertEqual(sampleText.position(of: "b"), 3)
        XCTAssertEqual(sampleText.position(of: "not"), 9)
        XCTAssertEqual(sampleText.position(of: "be"), 15)
        XCTAssertEqual(sampleText.position(of: "ques"), 31)
        XCTAssertEqual(sampleText.position(of: "xyz"), nil)
        XCTAssertEqual(sampleText.position(of: "é"), 4)
    }

}
