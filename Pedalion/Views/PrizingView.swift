//
//  PrizingView.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 23/12/25.
//

import SwiftUI

struct PrizingView: View {
    @State private var viewModel = CartViewModel.shared
    var validCouponAvailable: Bool = false
    var body: some View {
        VStack{
            row(label: "Subtotal", value: viewModel.calculateSubtotal())
            row(label: "Delivery Fee:", value: 0)
            row(label: "Discount:", value: validCouponAvailable ? 30 : 0, toPercentage: true)
            row(label: "", value: nil)
            row(label: "Total:", value: viewModel.calculateDiscountedPrice(discount: validCouponAvailable ? 30.0 : 0.0), bold: true)
            
            Button {
                
            } label: {
                Text("Checkout")
                    .bold()
                    .foregroundStyle(.white)
                    .frame(width: 200, height: 50)
                    .background(LinearGradient(colors: [.blue, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 12)
//                            .stroke(.white, lineWidth: 2)
//                    )
                    
                    
            }
        }
        .padding()
    }
    
    private func row(label: String, value: Double?, toPercentage: Bool = false, bold: Bool = false) -> some View{
        HStack{
            Text(label)
                .bold()
            Spacer()
            if toPercentage{
                Text(value?.toPercentage() ?? "")
                    .foregroundStyle(.secondary)
            }else{
                Text("\(value?.toCurrencyString() ?? "")")
                    .foregroundStyle(bold ? Color(red: 61/255.0, green: 156/255.0, blue: 234/255.0) : .secondary)
                    .bold(bold)
                    
            }
        }
    }
}


#Preview {
    PrizingView()
}
