//
//  SeparatorCellView.swift
//  swiftUItestApp
//
//  Created by Narek Stepanyan on 24.07.2020.
//  Copyright © 2020 NRKK.DEV. All rights reserved.
//

import SwiftUI

struct SeparatorCell: View {
    let height: CGFloat
    
    init(height: CGFloat) {
        self.height = height
    }
    
    var body: some View {
        SimpleView()
            .frame(height: height)
            .listRowInsets(EdgeInsets())
    }
}
