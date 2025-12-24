//
//  FavouritesView.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 23/12/25.
//

import SwiftUI

struct FavouritesView: View {
    @Environment(HomeViewModel.self) private var viewModel
    @Binding var showTabBar: Bool
    var body: some View {
        NavigationStack{
            ZStack{
                backgroundView
                if viewModel.getFavouriteProducts().count == 0{
                    ContentUnavailableView(
                        "No Favourites Yet",
                        systemImage: "heart.slash",
                        description:
                            Text("Items you mark as favourites will appear here.")
                    )
                }else {
                    ScrollView{
                        VStack{
                            productListView
                        }
                    }
                    .safeAreaInset(edge: .top) {
                        Color.clear.frame(height: 30)
                    }
                    .safeAreaInset(edge: .bottom) {
                        Color.clear.frame(height: 70)
                    }
                }
            }
            .navigationTitle("Favourites")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

extension FavouritesView{
    private var backgroundView: some View{
        Color(.primaryBackground)
            .ignoresSafeArea()
    }
    
    private var productListView: some View {
        VStack {
            let pairs = viewModel.getFavouriteProducts().chunked(into: 2)
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
}

#Preview {
    FavouritesView(showTabBar: .constant(false))
        .environment(HomeViewModel())
}
