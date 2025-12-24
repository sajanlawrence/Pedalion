//
//  OrderSuccessView.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 24/12/25.
//

import SwiftUI

struct OrderSuccessView: View {
    @Environment(TabRouter.self) private var tabRouter
    @State private var cartViewModel = CartViewModel.shared
    var body: some View {
        VStack(spacing: 20) {

            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 80))
                .foregroundStyle(.green)

            Text("Order Placed!")
                .font(.title)
                .bold()

            Text("Thank you for your purchase.\nYour order will be delivered soon.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)

            Button("Continue Shopping") {
                tabRouter.selectedTab = .home
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    OrderSuccessView()
}
