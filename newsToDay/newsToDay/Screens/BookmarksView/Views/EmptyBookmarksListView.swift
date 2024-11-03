//
//  EmptyBookmarksListView.swift
//  newsToDay
//
//  Created by Иван Семикин on 26/10/2024.
//

import SwiftUI

struct EmptyBookmarksListView: View {
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(.greyLighter)
                    .frame(width: 72, height: 72)
                Image("book")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            
            Text(LocalizedStringKey("You haven't saved any articles yet. Start reading and bookmarking them now."))
                .font(.system(size: 16))
                .multilineTextAlignment(.center)
                .frame(width: 256, alignment: .bottom)
        }
    }
}

#Preview {
    EmptyBookmarksListView()
}
