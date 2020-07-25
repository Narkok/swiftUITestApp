//
//  ActivityIndicator.swift
//  swiftUItestApp
//
//  Created by Narek Stepanyan on 25.07.2020.
//  Copyright © 2020 NRKK.DEV. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: View {
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        GeometryReader { (geometry: GeometryProxy) in
            ForEach(0..<5) { index in
                Group {
                    Circle()
                        .fill(Color.gray)
                        .frame(width: geometry.size.width / 6, height: geometry.size.height / 6)
                        .scaleEffect(!self.isAnimating ? 1 - CGFloat(index) / 5 : 0.2 + CGFloat(index) / 5)
                        .offset(y: geometry.size.width / 10 - geometry.size.height / 2)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .rotationEffect(!self.isAnimating ? .degrees(0) : .degrees(360))
                .animation(Animation
                .timingCurve(0.5, 0.15 + Double(index) / 5, 0.25, 1, duration: 2)
                .repeatForever(autoreverses: false))
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .onAppear { self.isAnimating = true }
    }
}
