//: Build the framework before running this playground.
import StringsHelper_Mac
//: Sample strings used to demonstrate
let sampleNums = "0123456789abcdef"
let sampleText = "To bé or not 👩‍👩‍👧‍👧 be, that is the question."

let multiLine = """
Here is a long string.
It has more than one line.
And the string even contains "quotes".
"""

let spacedString = "   This   string    has lots of extras    spaces.   "
let dollarString = " $45.00 "
let shortNumber = "123"
let longNumber = "1234567890"
//: Sub Strings
sampleNums.sub(from: 9)
sampleNums.sub(from: -3)
sampleNums.sub(from: 100)
sampleNums.sub(from: -100)

sampleNums.sub(upTo: 4)
sampleNums.sub(upTo: -3)
sampleNums.sub(upTo: 100)
sampleNums.sub(upTo: -100)

sampleNums.sub(from: 3, upTo: 7)
sampleNums.sub(from: 3, upTo: -5)
sampleNums.sub(from: 100, upTo: 110)
sampleNums.sub(from: 7, upTo: 3)
sampleNums.sub(from: 3, upTo: -50)
sampleNums.sub(from: 100, upTo: 3)

sampleText.position(of: "b")
sampleText.position(of: "not")
sampleText.position(of: "be")
sampleText.position(of: "ques")
sampleText.position(of: "xyz")
sampleText.position(of: "é")

sampleText.sub(from: "ques")
sampleText.sub(from: "abc")

sampleText.sub(upTo: "ques")
sampleText.sub(upTo: "abc")
sampleText.sub(from: "that")
sampleText.sub(from: "that", upTo: " que")
sampleText.sub(from: "abc", upTo: " que")
sampleText.sub(from: "be", upTo: "xyz")
//: Components
sampleNums.length
sampleText.length

multiLine.words
multiLine.wordCount
multiLine.lines
multiLine.lineCount

multiLine.titleCase
multiLine.titleCaseAll
//: Encoding
let encode = sampleText.urlEncode()
let encode1 = sampleText.urlEncode(for: .query)
let encode2 = sampleText.urlEncode(for: .form)

encode?.urlDecode()
encode1?.urlDecode(for: .query)
encode2?.urlDecode(for: .form)

let base64 = sampleText.base64Encode(lineLength: 76)
base64?.base64Decode()
//: Trim & Pad
spacedString.trim()
spacedString.trimLeft()
spacedString.trimRight()

dollarString.trim(using: "$.0")
dollarString.trimLeft(using: "$.0")
dollarString.trimRight(using: "$.0")

shortNumber.padLeft(to: 6, with: "*")
shortNumber.padLeft(to: 6)
shortNumber.padRight(to: 6, with: "*")
shortNumber.padRight(to: 6)

longNumber.padLeft(to: 6, with: ".")
longNumber.padRight(to: 5, with: "-")
