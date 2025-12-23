//
//  CouponInputView.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 23/12/25.
//

import SwiftUI

struct CouponInputView: View {
    @State private var couponCode: String = ""

    var onApply: (String) -> Void

    var body: some View {
        HStack(spacing: 12) {
            TextField("Enter coupon code", text: $couponCode)
                .textInputAutocapitalization(.characters)
                .disableAutocorrection(true)
                .padding(.horizontal, 12)
                .frame(height: 44)
                .background(Color(.systemGray6))
                .cornerRadius(8)

            Button {
                onApply(couponCode)
            } label: {
                Text("Apply")
                    .fontWeight(.semibold)
                    .frame(width: 80, height: 30)
            }
            .buttonStyle(.borderedProminent)
            .disabled(couponCode.isEmpty)
        }
        .padding(.horizontal)
    }
}


#Preview {
    CouponInputView(){_ in }
}
