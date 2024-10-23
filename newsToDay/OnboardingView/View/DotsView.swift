//
//  DotsView.swift
//  newsToDay
//
//  Created by Sergey Zakurakin on 10/22/24.
//

import SwiftUI

struct DotsView: View {
    
    var total: Int
    var currentIndex: Int
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<total, id: \.self) { index in
                Rectangle()
                    .fill(index == currentIndex ? .blue : .gray.opacity(0.2))
                    .frame(width: index == currentIndex ? 30 : 12, height: 12)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .scaleEffect(index == currentIndex ? 1.2 : 1.0)
                    .animation(.spring(), value: currentIndex)
            }
        }
        .padding(.top, 20)
    }
}

#Preview {
    DotsView(total: 3, currentIndex: 1)
}
