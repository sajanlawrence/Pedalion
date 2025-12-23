//
//  HomeView.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 21/12/25.
//

import SwiftUI

struct HomeView: View {
    @Environment(HomeViewModel.self) private var viewModel
    @State private var selectedBtnId: Int = 1
    @Binding var showTabBar: Bool
    var body: some View {
            ZStack{
                backgroundView
                ScrollView{
                    content
                }
                .frame(maxWidth: .infinity)
            }
    }
}

extension HomeView{
    private var content: some View {
        VStack(alignment: .center) {
            headerView
            topView

            VStack(spacing: 0) {
                buttonsView
                productListView
            }
        }
        .navigationDestination(for: Item.self) { item in
            ProductDetailView(product: item)
                .onAppear{
                    showTabBar = false
                }
                .onDisappear{
                    showTabBar = true
                }
        }
    }

    private var topView: some View{
        ZStack{
            Image(.cardBackground)
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 400)
                .offset(y: -3)
            
            VStack(alignment: .leading){
                Image(.bicycle1)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 316, height: 153)
                    .offset(y: -30)
                Text("30% Off")
                    .foregroundStyle(.gray)
                    .font(.system(size: 26, weight: .bold))
                    .offset(y: -20)
            }
        }
        .offset(y: -20)
    }
    
    private var productListView: some View {
        VStack {
            let pairs = viewModel.filterItems.chunked(into: 2)
            ForEach(pairs.indices, id: \.self) { index in
                let pair = pairs[index]

                HStack(spacing: 20) {
                    NavigationLink(value: pair[0]) {
                        CardView(item: pair[0]) {
                            viewModel.updateFavourite(item: pair[0])
                        }
                    }

                    if pair.count > 1 {
                        NavigationLink(value: pair[1]) {
                            CardView(item: pair[1]) {
                                viewModel.updateFavourite(item: pair[1])
                            }
                            .offset(y: -35)
                        }
                    }
                }
            }
        }
        .offset(y: -70)
    }
    
    private var backgroundView: some View{
        Group{
            Color(.primaryBackground)
                .ignoresSafeArea()
            Rectangle()
                .rotation(Angle(degrees: 30))
                .foregroundStyle(LinearGradient(colors: [.blue, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 600, height: 800)
                .offset(x: 120, y: 200)
        }
    }
    
    private var headerView: some View{
        HStack(){
            Text("Choose Your Bike")
                .foregroundStyle(.white)
                .font(.system(size: 25, weight: .bold))
            Spacer()
            
        }
        .frame(maxWidth: 350)
        .padding(.horizontal)
        .padding(.top)
    }
    
    private var buttonsView: some View{
        HStack(spacing: 25) {
            ForEach(viewModel.categoryButtons) { item in
                CategoryIconButton(item: item, selectedId: $selectedBtnId){
                    viewModel.categoryBtnTapped(btn: item)
                }
            }
        }
        .offset(y: -80)
    }
}
#Preview {
    HomeView(showTabBar: .constant(true))
        .environment(HomeViewModel())
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}
