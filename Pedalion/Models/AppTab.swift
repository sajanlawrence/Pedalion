//
//  AppTab.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 23/12/25.
//

import Foundation

enum AppTab: CaseIterable{
    case home
    case favourites
    case cart
    
    var title: String {
        switch self {
        case .home:
            "Home"
        case .favourites:
            "Favourites"
        case .cart:
            "Cart"
        }
    }
    
    var icon: String {
        switch self {
        case .home:
            "house.fill"
        case .favourites:
            "heart.fill"
        case .cart:
            "cart.fill"
        }
    }
}
