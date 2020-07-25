//
//  MainListViewModel.swift
//  swiftUItestApp
//
//  Created by Narek Stepanyan on 25.07.2020.
//  Copyright © 2020 NRKK.DEV. All rights reserved.
//

import Combine
import Foundation

class MainListViewModel: ObservableObject {
    @Published var usersList: [UserCellView.Data] = []
    
    @Published var reload: Void = ()

    private var cancellableSet: Set<AnyCancellable> = []
    
    private var service: UsersDataManager
    
    init(_ service: UsersDataManager = UsersService()) {
        self.service = service
        
        $reload
            .flatMap { service.fetchUsers() }
            .map { MainListViewModel.prepare(data: $0) }
            .assign(to: \.usersList, on: self)
            .store(in: &self.cancellableSet)
    }
    
    private static func prepare(data: [UserInfo]) -> [UserCellView.Data] {
        if data.count == 0 { return [] }
        if data.count == 1 { return [.init(userInfo: data[0], position: .single)] }
        var result = [UserCellView.Data]()
        data.sorted().enumerated().forEach { (index, userInfo) in
            if index == data.count - 1 { result.append(.init(userInfo: userInfo, position: .bottom)) }
            else if index == 0         { result.append(.init(userInfo: userInfo, position: .top)) }
            else                       { result.append(.init(userInfo: userInfo, position: .middle)) }
        }
        return result
    }
}
