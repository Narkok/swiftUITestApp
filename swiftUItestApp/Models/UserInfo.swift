//
//  UserInfo.swift
//  swiftUItestApp
//
//  Created by Narek Stepanyan on 24.07.2020.
//  Copyright © 2020 NRKK.DEV. All rights reserved.
//

import Foundation

/// Модель структуры пользователя
struct UserInfo: Codable, Comparable, Hashable {
    
    /// Сравнение для сортировки пользователей по дате обновления
    static func < (lhs: UserInfo, rhs: UserInfo) -> Bool {
        guard let dateL = dateFormatter.date(from: lhs.updatedAt) else { return true }
        guard let dateR = dateFormatter.date(from: rhs.updatedAt) else { return true }
        return dateL < dateR
    }
    
    static let dateFormatter = DateFormatter(format: "yyyy'-'MM'-'dd' 'HH':'mm':'ss' 'zzz")
    
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    let avatarURL: String?
    let updatedAt: String
    let deviceID: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case firstName
        case lastName
        case email
        case avatarURL
        case updatedAt
        case deviceID
    }
    
    init(name: String, email: String) {
        self.id = ""
        self.firstName = name
        self.lastName = "Kek"
        self.email = email
        self.avatarURL = ""
        self.updatedAt = ""
        self.deviceID = ""
    }
}
