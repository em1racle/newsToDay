//
//  Category.swift
//  newsToDay
//
//  Created by Иван Семикин on 27/10/2024.
//

import Foundation
import SwiftUICore

enum Category: String, CaseIterable {
    case sports = "Sports"
    case business = "Business"
    case entertainment = "Entertainment"
    case general = "General"
    case health = "Health"
    case science = "Science"
    case technology = "Technology"
    
    var localizedKey: LocalizedStringKey {
        LocalizedStringKey(rawValue.capitalized)
    }
}