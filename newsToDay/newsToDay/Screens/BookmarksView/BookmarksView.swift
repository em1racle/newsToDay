//
//  BookmarksView.swift
//  newsToDay
//
//  Created by Никита Мартьянов on 23.10.24.
//

import SwiftUI

// Text(LocalizedStringKey("Bookmarks"))
// Text(LocalizedStringKey("Saved articles to the library"))
//Text(LocalizedStringKey("You haven't saved any articles yet. Start reading and bookmarking them now."))

struct BookmarksView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(LocalizedStringKey("Saved articles to the library"))
                        .foregroundStyle(.secondary)
                }
                .navigationTitle(LocalizedStringKey("Bookmarks"))
            }
        }
    }
}

#Preview {
    BookmarksView()
}
