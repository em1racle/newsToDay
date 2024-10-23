//
//  BookmarksView.swift
//  newsToDay
//
//  Created by Никита Мартьянов on 23.10.24.
//

import SwiftUI

struct BookmarksView: View {
    var body: some View {
        NavigationView {
            VStack(spacing:24) {
                VStack(spacing:8) {
                    HStack {
                        Text("Bookmarks")
                            .font(.system(size: 24)
                                .weight(.semibold)
                            )
                        
                        Spacer()
                    }
                    HStack {
                        Text("Saved articles to the library")
                            .font(.system(size: 16))
                            .foregroundColor(.greyPrimary)
                        
                        Spacer()
                    }
                }
                
                Spacer()
                
                Button {
               
                } label: {
                    ZStack {
                        Circle()
                            .fill(.greyLighter)
                            .frame(width: 72, height: 72)
                        Image("book")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                }
                
                Text("You haven't saved any articles yet.Start reading and bookmarking them now")
                    .font(.system(size: 16))
                    .multilineTextAlignment(.center)
                    .frame(width: 256, alignment: .bottom)
                
                Spacer()
            }
            .padding()
            
        }
    }
}

#Preview {
    BookmarksView()
}
