//
//  DateFormatterExtension.swift
//  swiftUItestApp
//
//  Created by Narek Stepanyan on 24.07.2020.
//  Copyright © 2020 NRKK.DEV. All rights reserved.
//

import Foundation

extension DateFormatter {
    convenience init(format: String) {
        self.init()
        dateFormat = format
    }
}
