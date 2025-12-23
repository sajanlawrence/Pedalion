//
//  CartView.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 23/12/25.
//

import SwiftUI

struct CartView: View {
    @State private var viewModel = CartViewModel.shared
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundView
                
                if viewModel.cartItems.isEmpty {
                    ContentUnavailableView(
                        "Your Cart is Empty",
                        systemImage: "cart",
                        description: Text("Add bikes or accessories to your cart to see them here.")
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(viewModel.cartItems, id: \.self) { item in
                                SwipeRow {
                                    viewModel.remove(item: item)
                                } content: {
                                    ProductRowView(item: item)
                                        .listRowInsets(EdgeInsets())
                                        .listRowSeparator(.hidden)
                                        .listRowBackground(Color.clear)
                                        .contentMargins(.horizontal, 0)
                                        .onTapGesture { }
                                }
//                                ProductRowView(item: item)
//                                    .listRowInsets(EdgeInsets())
//                                    .listRowSeparator(.hidden)
//                                    .listRowBackground(Color.clear)
//                                    .contentMargins(.horizontal, 0)
//                                    .onTapGesture { }
                            }
                        }
                        .listStyle(.plain)
                        .scrollContentBackground(.hidden)
                        .frame(width: UIScreen.main.bounds.width)
                        .safeAreaInset(edge: .top) {
                            Color.clear.frame(height: 8)
                        }
                    }
                    
                }
            }
            .navigationTitle("Cart")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

extension CartView{
    private var backgroundView: some View{
        Group{
            Color(.primaryBackground)
                .ignoresSafeArea(.container, edges: .top)
        }
    }
}

#Preview {
    CartView()
}
