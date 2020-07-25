//
//  MainListView.swift
//  swiftUItestApp
//
//  Created by Narek Stepanyan on 23.07.2020.
//  Copyright © 2020 NRKK.DEV. All rights reserved.
//

import SwiftUI

struct MainListView: View {
    
    let backgroundColor = UIColor(white: 0.95, alpha: 1)
    
    
    init() {
        UIScrollView.appearance().backgroundColor = backgroundColor
    }
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    SeparatorCell(height: 10)
                    ForEach(testUserList, id: \.self) { data in
                        UserCellView(data: data)
                    }
                    SeparatorCell(height: 10)
                }
            }
            .navigationBarTitle("Users")
        }
    }
}


struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
    }
}


//UIDevice.current.identifierForVendor?.uuidString


let testUserList: [UserCellView.Data] = [
    .init(userInfo: UserInfo(name: "Lol1", email: "qwe@qwe.qwe"), position: .top),
    .init(userInfo: UserInfo(name: "Lol2", email: "qwe@qwe.qwe"), position: .middle),
    .init(userInfo: UserInfo(name: "Lol3", email: "qwe@qwe.qwe"), position: .middle),
    .init(userInfo: UserInfo(name: "Lol2", email: "qwe@qwe.qwe"), position: .middle),
    .init(userInfo: UserInfo(name: "Lol3", email: "qwe@qwe.qwe"), position: .middle),
    .init(userInfo: UserInfo(name: "Lol2", email: "qwe@qwe.qwe"), position: .middle),
    .init(userInfo: UserInfo(name: "Lol3", email: "qwe@qwe.qwe"), position: .middle),
    .init(userInfo: UserInfo(name: "Lol2", email: "qwe@qwe.qwe"), position: .middle),
    .init(userInfo: UserInfo(name: "Lol3", email: "qwe@qwe.qwe"), position: .middle),
    .init(userInfo: UserInfo(name: "Lol2", email: "qwe@qwe.qwe"), position: .middle),
    .init(userInfo: UserInfo(name: "Lol3", email: "qwe@qwe.qwe"), position: .middle),
    .init(userInfo: UserInfo(name: "Lol2", email: "qwe@qwe.qwe"), position: .middle),
    .init(userInfo: UserInfo(name: "Lol3", email: "qwe@qwe.qwe"), position: .middle),
    .init(userInfo: UserInfo(name: "Lol2", email: "qwe@qwe.qwe"), position: .middle),
    .init(userInfo: UserInfo(name: "Lol3", email: "qwe@qwe.qwe"), position: .middle),
    .init(userInfo: UserInfo(name: "Lol4", email: "qwe@qwe.qwe"), position: .bottom)
]
