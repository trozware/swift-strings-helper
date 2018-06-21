//
//  StringsComponentsTests.swift
//  StringsHelperTests
//
//  Created by Sarah Reichelt on 20/6/18.
//  Copyright © 2018 TrozWare. All rights reserved.
//

import XCTest
@testable import StringsHelper_Mac

class StringsComponentsTests: XCTestCase {

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

    func testLength() {
        XCTAssertEqual(sampleNums.length, sampleNums.count)
        XCTAssertEqual(sampleText.length, sampleText.count)
        XCTAssertEqual(multiLine.length, multiLine.count)
    }

    func testWords() {
        XCTAssertEqual(sampleNums.words, [sampleNums])
        XCTAssertEqual(sampleText.words, ["To", "bé", "or", "not", "👩‍👩‍👧‍👧", "be,", "that", "is", "the", "question."])
        XCTAssertEqual(multiLine.words, ["Here", "is", "a", "string.",
                                         "It", "has", "more", "than", "one", "line.",
                                         "And", "it", "even", "contains", "\"quotes\"."])
    }

    func testWordCount() {
        XCTAssertEqual(sampleNums.wordCount, 1)
        XCTAssertEqual(sampleText.wordCount, 10)
        XCTAssertEqual(multiLine.wordCount, 15)
    }

    func testLines() {
        XCTAssertEqual(sampleNums.lines, [sampleNums])
        XCTAssertEqual(sampleText.lines, [sampleText])
        XCTAssertEqual(multiLine.lines, [
            "Here is a string.",
            "It has more than one line.",
            "And it even contains \"quotes\"."
            ])
    }

    func testLineCount() {
        XCTAssertEqual(sampleNums.lineCount, 1)
        XCTAssertEqual(sampleText.lineCount, 1)
        XCTAssertEqual(multiLine.lineCount, 3)
    }

    func testTitleCaseEveryWord() {
        let plainTitle = "the day the world Stood still"
        let title = plainTitle.titleCaseAll
        XCTAssertEqual(title, "The Day The World Stood Still")
    }

    func testTitleCase() {
        let plainTitle = "the time Of The dragon"
        let title = plainTitle.titleCase
        XCTAssertEqual(title, "The Time of the Dragon")
    }

    func testTitleCaseTwoSentences() {
        let plainTitle = "the time of the dragon. the way of the sword"
        let title = plainTitle.titleCase
        XCTAssertEqual(title, "The Time of the Dragon. The Way of the Sword")
    }
}
