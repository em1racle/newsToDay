//
//  ImageView.swift
//  newsToDay
//
//  Created by Sergey Zakurakin on 10/22/24.
//

import SwiftUI

struct ImageView: View {
    
    var images: [String]
    var currentIndex: Int
    var offset: CGSize
    var getOffsetForSquare: (Int) -> CGFloat
    var getScaleAmount: () -> CGFloat
    
    var body: some View {
        ZStack {
            ForEach(0..<images.count, id: \.self) { index in
                Image(images[index])
                    .resizable()
                    .scaledToFill()
                    .frame(width: 288, height: 336)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .offset(x: getOffsetForSquare(index) + offset.width, y: 0)
                    .scaleEffect(index == currentIndex ? getScaleAmount() : 0.8)
                    .opacity(index == currentIndex ? 1.0 : 0.7)
                    .animation(.spring(), value: currentIndex)
            }
        }
    }
}

#Preview {
    ImageView(
        images: ["TestImageOfNews", "TestImageOfNews", "TestImageOfNews"],
        currentIndex: 0,
        offset: .zero,
        getOffsetForSquare: { _ in 0 },
        getScaleAmount: { 1.0 }
    )
}
