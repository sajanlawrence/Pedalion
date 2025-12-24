//
//  RootView.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 23/12/25.
//

import SwiftUI

struct RootView: View {
    @State private var showTabBar: Bool = true
    @Environment(TabRouter.self) private var tabRouter
    var body: some View {
        VStack(spacing: 0){
            ZStack{
                switch tabRouter.selectedTab {
                case .home:
                    NavigationStack{
                        HomeView(showTabBar: $showTabBar)
                    }
                case .favourites:
                    FavouritesView(showTabBar: $showTabBar)
                case .cart:
                    CartView()
                case .orders:
                    OrdersView()
                }
            
            }
            .safeAreaInset(edge: .bottom) {
                if showTabBar {
                    BottomTabBar()
                }
            }
        }
    }
}

#Preview {
    RootView()
        .environment(HomeViewModel())
}
