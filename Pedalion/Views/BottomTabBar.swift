//
//  BottomTabBar.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 23/12/25.
//

import SwiftUI

struct BottomTabBar: View {
    @Environment(TabRouter.self) private var tabRouter
    var body: some View {
        ZStack(alignment: .center){
            Image(.tabBarBG)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
               
            HStack{
                ForEach(AppTab.allCases, id: \.self) { tab in
                    Button {
                        tabRouter.selectedTab = tab
                    } label: {
                        VStack(spacing: 4) {
                            Image(systemName: tab.icon)
                                .font(.system(size: 18))
                            Text(tab.title)
                                .font(.caption)
                        }
                        .foregroundStyle(tabRouter.selectedTab == tab ? .blue : .gray)
                        .frame(maxWidth: .infinity)
                    }
                    
                }
            }
        }
        .frame(height: 80)
        .frame(maxWidth: .infinity)
        .offset(y: 20)
    }
}

#Preview {
    BottomTabBar()
}
