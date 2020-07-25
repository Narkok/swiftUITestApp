//
//  MainListView.swift
//  swiftUItestApp
//
//  Created by Narek Stepanyan on 23.07.2020.
//  Copyright © 2020 NRKK.DEV. All rights reserved.
//

import SwiftUI

struct MainListView: View {
    
    static let backgroundColor = UIColor(white: 0.95, alpha: 1)
    
    @ObservedObject var viewModel = MainListViewModel(MockUsersService())
    
    
    init() {
        UIScrollView.appearance().backgroundColor = MainListView.backgroundColor
    }
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    SeparatorCell(height: 10)
                    ForEach(self.viewModel.usersList, id: \.self) { data in
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
