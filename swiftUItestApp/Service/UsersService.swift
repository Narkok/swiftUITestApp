//
//  UsersService.swift
//  swiftUItestApp
//
//  Created by Narek Stepanyan on 25.07.2020.
//  Copyright © 2020 NRKK.DEV. All rights reserved.
//

import Foundation
import Combine


struct UsersService: UsersDataManager {
    static let usersBaseURL = URL(string: "http://342634-cf64550.tmweb.ru/users")!
    
    func fetchUsers() -> AnyPublisher<[UserInfo], Never> {
        return URLSession.shared.dataTaskPublisher(for: UsersService.usersBaseURL)
            .map { $0.data }
            .decode(type: [UserInfo].self, decoder: JSONDecoder())
            .catch { error in Just([UserInfo]()) }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}


protocol UsersDataManager {
    func fetchUsers() -> AnyPublisher<[UserInfo], Never>
}


enum ServiceError: Error {
    case none
}
