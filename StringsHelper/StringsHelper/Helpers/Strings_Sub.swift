//
//  Strings_Sub.swift
//  StringsHelperTests
//
//  Created by Sarah Reichelt on 20/6/18.
//  Copyright © 2018 TrozWare. All rights reserved.
//

import Foundation

extension String {

    // MARK: - Substrings by character position

    public func sub(from startPos: Int) -> String {
        if startPos > count { return "" }
        if startPos < 0 {
            if startPos < -count { return self }
            return String(suffix(-startPos))
        }
        return String(suffix(count - startPos))
    }

    public func sub(upTo endPos: Int) -> String {
        if endPos < 0 {
            if endPos < -count { return "" }
            return String(prefix(count + endPos))
        }
        return String(prefix(endPos))
    }

    public func sub(from startPos: Int, upTo endPos: Int) -> String {
        if startPos > count { return "" }
        if endPos < -count { return "" }

        let front = sub(upTo: endPos)
        let slice = front.sub(from: startPos)
        return slice
    }

    // MARK: - Location of string as a number

    public func position(of substr: String) -> Int? {
        if let subRange = range(of: substr) {
            let sub = prefix(upTo: subRange.lowerBound)
            return sub.count
        }
        return nil
    }

    // MARK: - Substrings by string

    public func sub(from startString: String) -> String {
        guard let startPos = position(of: startString) else {
            return ""
        }
        let sub = suffix(count - startPos)
        return String(sub)
    }

    public func sub(upTo endString: String) -> String {
        guard let endPos = position(of: endString) else {
            return self
        }
        let sub = prefix(endPos)
        return String(sub)
    }

    public func sub(from startString: String, upTo endString: String) -> String {
        let front = sub(upTo: endString)
        let slice = front.sub(from: startString)
        return slice
    }
}
