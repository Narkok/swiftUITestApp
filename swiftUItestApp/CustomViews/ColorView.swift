//
//  ColorView.swift
//  swiftUItestApp
//
//  Created by Narek Stepanyan on 24.07.2020.
//  Copyright © 2020 NRKK.DEV. All rights reserved.
//

import SwiftUI

struct ColorView: View {
    let color: Color
    
    init(_ color: Color) {
        self.color = color
    }
    
    var body: some View {
        GeometryReader { _ in Path() }
            .background(color)
    }
}
