//
//  Strings_Components.swift
//  StringsHelper
//
//  Created by Sarah Reichelt on 20/6/18.
//  Copyright © 2018 TrozWare. All rights reserved.
//

import Foundation

extension String {

    // MARK: - Components

    public var length: Int { return self.count }

    public var words: [String] {
        return self.components(separatedBy: .whitespacesAndNewlines)
    }

    public var wordCount: Int {
        return words.count
    }

    public var lines: [String] {
        return self.components(separatedBy: .newlines)
    }

    public var lineCount: Int {
        return lines.count
    }

    public var titleCaseAll: String {
        return words.map { word -> String in
            word.prefix(1).uppercased() + word.suffix(word.length - 1).lowercased()
        }.joined(separator: " ")
    }

    public var titleCase: String {
        let excludedWords = [
            "a", "an", "the", "and", "but", "or", "nor", "for", "so", "yet",
            "at", "by", "for", "from", "in", "into", "of", "on", "to", "with"
        ]
        let endOfSentenceChars = ".?!"
        var doneFirstWord = false

        let titleWords = words.map { word -> String in
            let casedWord: String
            if doneFirstWord == true && excludedWords.contains(word.lowercased()) {
                casedWord = word.lowercased()
            } else {
                casedWord = word.prefix(1).uppercased() + word.suffix(word.length - 1).lowercased()
            }
            doneFirstWord = !endOfSentenceChars.contains(word.suffix(1))
            return casedWord
        }
        return titleWords.joined(separator: " ")
    }

}
