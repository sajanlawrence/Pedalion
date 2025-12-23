//
//  RootView.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 23/12/25.
//

import SwiftUI

struct RootView: View {
    @State private var selectedTab: AppTab = .home
    @State private var showTabBar: Bool = true
    var body: some View {
        VStack(spacing: 0){
            ZStack{
                switch selectedTab {
                case .home:
                    NavigationStack{
                        HomeView(showTabBar: $showTabBar)
                    }
                case .favourites:
                    FavouritesView(showTabBar: $showTabBar)
                case .cart:
                    CartView()
                case .profile:
                    Text("Profile")
                }
            }
            .safeAreaInset(edge: .bottom) {
                if showTabBar {
                    BottomTabBar(selectedTab: $selectedTab)
                }
            }
        }
    }
}

#Preview {
    RootView()
        .environment(HomeViewModel())
}
