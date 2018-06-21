//
//  Strings_Pad_Trim.swift
//  StringsHelper
//
//  Created by Sarah Reichelt on 20/6/18.
//  Copyright © 2018 TrozWare. All rights reserved.
//

import Foundation

extension String {

    // MARK: - Trim

    public func trim(using trimChars: String = "") -> String {
        var trimSet = CharacterSet.whitespacesAndNewlines
        trimSet.insert(charactersIn: trimChars)
        return self.trimmingCharacters(in: trimSet)
    }

    public func trimLeft(using trimChars: String = "") -> String {
        var trimmedString = self
        var trimSet = CharacterSet.whitespacesAndNewlines
        trimSet.insert(charactersIn: trimChars)

        while let firstChar = trimmedString.first,
            let scalar = Unicode.Scalar(String(firstChar)),
            trimSet.contains(scalar) {
            trimmedString = trimmedString.sub(from: 1)
        }

        return trimmedString
    }

    public func trimRight(using trimChars: String = "") -> String {
        var trimmedString = self
        var trimSet = CharacterSet.whitespacesAndNewlines
        trimSet.insert(charactersIn: trimChars)

        while let lastChar = trimmedString.last,
            let scalar = Unicode.Scalar(String(lastChar)),
            trimSet.contains(scalar) {
                trimmedString = trimmedString.sub(upTo: -1)
        }

        return trimmedString
    }

    // MARK: - Pad

    public func padLeft(to length: Int, with spacer: String = " ") -> String {
        if count > length {
            return sub(upTo: length)
        }
        let pad = Array.init(repeating: spacer, count: length - count)
        let paddedString = self + pad.joined()
        return paddedString
    }

    public func padRight(to length: Int, with spacer: String = " ") -> String {
        if count > length {
            return sub(upTo: length)
        }
        let pad = Array.init(repeating: spacer, count: length - count)
        let paddedString = pad.joined() + self
        return paddedString
    }

}
