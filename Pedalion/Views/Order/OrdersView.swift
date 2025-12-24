//
//  OrdersView.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 24/12/25.
//

import SwiftUI

struct OrdersView: View {
    @State private var ordersVM = OrdersViewModel.shared
    var body: some View {
        NavigationStack {
            ZStack{
                backgroundView
                if ordersVM.orders.isEmpty{
                    ContentUnavailableView(
                        "No Orders Yet",
                        systemImage: "shippingbox",
                        description: Text("You haven’t placed any orders yet. Once you do, they’ll appear here.")
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }else{
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(ordersVM.orders.sorted(), id: \.self) { order in
                                OrderRowView(order: order)
                                    .padding()
                            }
                        }
                        .listStyle(.plain)
                        .scrollContentBackground(.hidden)
                        .frame(width: UIScreen.main.bounds.width)
                        .safeAreaInset(edge: .top) {
                            Color.clear.frame(height: 8)
                        }
                        Spacer()
                            .frame(height: 100)
                    }
                    
                }
            }
            .navigationTitle("Orders")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

extension OrdersView{
    private var backgroundView: some View{
        Color(.primaryBackground)
            .ignoresSafeArea()
    }
}

#Preview {
    OrdersView()
}
