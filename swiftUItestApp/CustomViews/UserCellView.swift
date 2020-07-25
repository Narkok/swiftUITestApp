//
//  UserCellView.swift
//  swiftUItestApp
//
//  Created by Narek Stepanyan on 24.07.2020.
//  Copyright © 2020 NRKK.DEV. All rights reserved.
//

import SwiftUI

struct UserCellView: View {
    
    @Environment(\.imageCache) var cache: ImageCache
    
    let userInfo: UserInfo
    let roundedCornens: UIRectCorner
    let position: Position
    
    
    init(userInfo: UserInfo, position: Position = .middle) {
        self.userInfo = userInfo
        self.position = position
        switch position {
        case .top:    self.roundedCornens = [.topLeft, .topRight]
        case .bottom: self.roundedCornens = [.bottomLeft, .bottomRight]
        case .middle: self.roundedCornens = []
        }
    }
    
    
    init(data: Data) {
        self.init(userInfo: data.userInfo, position: data.position)
    }

    
    var body: some View {
        ZStack {
            ColorView(.white)
                .cornerRadius(12, corners: roundedCornens)
                .padding(.horizontal, 14)
            
            Group {
                if position == .bottom {
                    EmptyView()
                } else {
                    VStack {
                        Spacer()
                        ColorView(Color(white: 0.9))
                            .frame(height: 0.5)
                            .padding(.leading, 28)
                            .padding(.trailing, 14)
                    }
                }
            }

            HStack(alignment: .center, spacing: 16) {
                AsyncImage(url: URL(string: "http://nrkk.ru/frogogoTestAppAvatars/avatar4.png")!,
                           cache: self.cache,
                           placeholder: ActivityIndicator(),
                           configuration: { $0.resizable() })
                    .frame(width: 60, height: 60, alignment: .leading)
                    .cornerRadius(30)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(userInfo.firstName + " " + userInfo.lastName)
                        .frame(alignment: .leading)
                    Text(userInfo.email)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .frame(alignment: .leading)
                }
                Spacer()
            }
            .padding(.horizontal, 28)
        }
        .frame(height: 82)
        .listRowInsets(EdgeInsets())
        .background(Color.clear)
    }
}


extension UserCellView {
    struct Data: Hashable {
        let userInfo: UserInfo
        let position: UserCellView.Position
    }
    
    
    enum Position {
        case top
        case bottom
        case middle
    }
}
