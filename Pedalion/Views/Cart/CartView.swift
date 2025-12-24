//
//  CartView.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 23/12/25.
//

import SwiftUI

struct CartView: View {
    @State private var viewModel = CartViewModel.shared
    @State private var isValidCoupon: Bool?
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
                            }
                        }
                        .listStyle(.plain)
                        .scrollContentBackground(.hidden)
                        .frame(width: UIScreen.main.bounds.width)
                        .safeAreaInset(edge: .top) {
                            Color.clear.frame(height: 8)
                        }
                        CouponInputView { couponCode in
                            isValidCoupon = viewModel.checkValidCoupon(coupon: couponCode)
                        }
                        
                        if let flag = isValidCoupon{
                            Text(flag ? "You saved 30% on this order!" : "Invalid coupon code")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(flag ? .green : .red)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 10)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.green.opacity(0.1))
                                )
                        }
                        PrizingView(validCouponAvailable: isValidCoupon ?? false)
                        Spacer()
                            .frame(height: 100)
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
