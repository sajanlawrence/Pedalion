//
//  OrderRowView.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 24/12/25.
//

import SwiftUI
//struct Customer: Identifiable, Hashable{
//    let id = UUID()
//    let name: String
//    let phoneNumber: String
//    let email: String
//    let address: String

struct OrderRowView: View {
    let order: Order
    @State private var isExpanded = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            // Order ID
            HStack {
                Text("Order ID:")
                    .bold()
                    .font(.system(size: 20))
                Text(order.id)
                    .font(.system(size: 18))
                    .foregroundStyle(.secondary)
            }

            Divider()

            // Items
            ForEach(order.items) { item in
                itemRowView(item: item)
            }

            Text("Expected delivery: Within 3–5 business days")
                .foregroundStyle(.green.opacity(0.8))

            Button {
                withAnimation(.easeInOut) {
                    isExpanded.toggle()
                }
            } label: {
                HStack {
                    Text("More info")
                        .bold()
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                }
                .foregroundStyle(.primary)
            }

            // Expanded content
            if isExpanded {
                VStack(alignment: .leading, spacing: 8) {

                    //Divider()

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Shipping Address")
                            //.font(.subheadline)
                            .bold()

                        Text(order.customerInfo.address.capitalized)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }

                    HStack {
                        Text("Total Paid")
                            .bold()
                        Spacer()
                        Text(order.totalAmount.toCurrencyString())
                            .foregroundStyle(.secondary)
                    }
                }
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .padding()
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}


extension OrderRowView{
    func itemRowView(item: Item) -> some View{
        HStack{
            Image(item.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            VStack(alignment: .leading){
                Text(item.itemName)
                    .bold()
                Text(item.itemType)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            HStack(spacing: 2){
                Text("Qty: ")
                    //.bold()
                Text("\(order.quantities[item.id] ?? 0)")
                    .foregroundStyle(.secondary)
            }
            .padding(.trailing)
        }
        .frame(height: 100)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    OrderRowView(order: .default)
}
