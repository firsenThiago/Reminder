//
//  String+Extensions.swift
//  Reminder
//
//  Created by Thiago Firsen on 05/02/25.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
