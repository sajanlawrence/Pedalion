//
//  CheckoutView.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 24/12/25.
//

import SwiftUI

struct CheckoutView: View {

    @State private var name = ""
    @State private var phone = ""
    @State private var email = ""
    @State private var address = ""
    
    @State private var nameError: String?
    @State private var phoneError: String?
    @State private var emailError: String?
    @State private var addressError: String?
    
    @State private var showSuccessScreen: Bool = false
    @State private var cartViewModel = CartViewModel.shared

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                // MARK: - Contact Details
                sectionTitle("Contact Details")

                inputField(
                    title: "Full Name",
                    text: $name,
                    keyboard: .namePhonePad,
                    error: nameError
                )
                
                .onChange(of: name) { _, _ in nameError = nil }

                inputField(
                    title: "Phone Number",
                    text: $phone,
                    keyboard: .phonePad,
                    error: phoneError
                )
                .onChange(of: phone) { _, _ in phoneError = nil }

                inputField(
                    title: "Email",
                    text: $email,
                    keyboard: .emailAddress,
                    error: emailError
                )
                .onChange(of: email) { _, _ in emailError = nil }

                // MARK: - Shipping Address
                sectionTitle("Shipping Address")

                VStack(alignment: .leading, spacing: 6) {
                    TextField("Enter shipping address", text: $address, axis: .vertical)
                        .padding()
                        .frame(minHeight: 100, alignment: .top)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(addressError != nil ? Color.red : .clear, lineWidth: 1)
                        )

                    if let addressError {
                        Text(addressError)
                            .font(.footnote)
                            .foregroundStyle(.red)
                    }
                }
                .onChange(of: address) { _, _ in addressError = nil }

                Spacer(minLength: 20)

                // MARK: - Place Order Button
                Button {
                    if validateFields() {
                        cartViewModel.addOrder(
                            name: name,
                            phone: phone,
                            email: email,
                            address: address
                        )
                        cartViewModel.clearItems()
                        showSuccessScreen.toggle()
                    }
                } label: {
                    Text("Place Order")
                        .bold()
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
            }
            .padding()
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $showSuccessScreen) {
            OrderSuccessView()
        }
    }

    // MARK: - Reusable Views

    private func sectionTitle(_ text: String) -> some View {
        Text(text)
            .font(.headline)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func inputField(
        title: String,
        text: Binding<String>,
        keyboard: UIKeyboardType,
        error: String?
    ) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            TextField(title, text: text)
                .keyboardType(keyboard)
                .padding()
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(error != nil ? Color.red : .clear, lineWidth: 1)
                )

            if let error {
                Text(error)
                    .font(.footnote)
                    .foregroundStyle(.red)
            }
        }
    }
    
    private func validateFields() -> Bool {

        nameError = nil
        phoneError = nil
        emailError = nil
        addressError = nil

        var isValid = true

        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            nameError = "Full name is required"
            isValid = false
        }

        let phoneRegex = "^[0-9]{10}$"
        if !NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(with: phone) {
            phoneError = "Enter a valid 10-digit phone number"
            isValid = false
        }

        let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        if !NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email) {
            emailError = "Enter a valid email address"
            isValid = false
        }

        if address.trimmingCharacters(in: .whitespacesAndNewlines).count < 10 {
            addressError = "Please enter a complete shipping address"
            isValid = false
        }

        return isValid
    }

}


#Preview {
    CheckoutView()
}
