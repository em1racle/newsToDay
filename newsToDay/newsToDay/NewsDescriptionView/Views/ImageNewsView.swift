//
//  ImageView.swift
//  newsToDay
//
//  Created by Иван Семикин on 03/11/2024.
//

import SwiftUI

struct ImageNewsView: View {
    @State var imageUrl: URL?
    
    var body: some View {
        if let url = imageUrl {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 384)
                    .ignoresSafeArea(edges: .top)
            } placeholder: {
                Color.gray
            }
            .frame(height: 384)
            
        } else {
            Image(.imageNotFound)
                .resizable()
                .scaledToFill()
                .frame(height: 384)
                .ignoresSafeArea(edges: .top)
        }
    }
}
