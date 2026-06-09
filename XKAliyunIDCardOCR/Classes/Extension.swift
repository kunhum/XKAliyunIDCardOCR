//
//  Extension.swift
//  XKAliyunIDCardOCR
//
//  Created by Kenneth Tse on 2026/6/10.
//

import Foundation

public extension String {
    func ocrDateString(fromFormat: String = "yyyyMMdd", toFormat: String = "yyyy-MM-dd") -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = fromFormat
        guard let date = dateFormat.date(from: self) else { return self }
        dateFormat.dateFormat = toFormat
        return dateFormat.string(from: date) ?? self
    }
}
