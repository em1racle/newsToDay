//
//  AppRouter.swift
//  newsToDay
//
//  Created by Emir Byashimov on 26.10.2024.
//

import Foundation
import Observation

// Класс для управления навигацией по экранам приложения
@Observable
class AppRouter {
    // Массив маршрутов для управления переходами между экранами
    var appRoute: [MainViewPath] = []
}
