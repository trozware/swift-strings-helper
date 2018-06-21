//
//  Strings_Encoding.swift
//  StringsHelper
//
//  Created by Sarah Reichelt on 20/6/18.
//  Copyright © 2018 TrozWare. All rights reserved.
//

import Foundation

extension String {

    // MARK: - URL Encoding

    public enum StringUrlEncoding {
        case query, form

        var allowedCharacters: CharacterSet {
            let unreservedCharacters: String
            switch self {
            case .query:
                unreservedCharacters = "-._~/?"
            case .form:
                unreservedCharacters = "*-._ "
            }
            var allowed = CharacterSet.alphanumerics
            allowed.insert(charactersIn: unreservedCharacters)
            return allowed
        }
    }

    public func urlEncode(for encodingType: StringUrlEncoding = .query) -> String? {
        let allowed = encodingType.allowedCharacters
        var encoded = addingPercentEncoding(withAllowedCharacters: allowed)
        if encodingType == .form {
            encoded = encoded?.replacingOccurrences(of: " ", with: "+")
        }
        return encoded
    }

    public func urlDecode(for encodingType: StringUrlEncoding = .query) -> String? {
        var decoded = self
        if encodingType == .form {
            decoded = decoded.replacingOccurrences(of: "+", with: " ")
        }
        return decoded.removingPercentEncoding
    }

    // MARK: - Base64 Encoding

    public func base64Encode(lineLength: Int = 64) -> String? {
        guard let data = self.data(using: .utf8) else { return nil }

        let options: Data.Base64EncodingOptions
        if lineLength <= 64 {
            options = [ .lineLength64Characters ]
        } else if lineLength <= 76 {
            options = [ .lineLength76Characters ]
        } else {
            options = []
        }

        let base64 = data.base64EncodedString(options: options)
        return base64
    }

    public func base64Decode() -> String? {
        guard let data = Data(base64Encoded: self, options: [ .ignoreUnknownCharacters ]) else { return nil }

        if let decodedString = String(data: data, encoding: .utf8) {
            return decodedString
        }
        return self
    }

}
