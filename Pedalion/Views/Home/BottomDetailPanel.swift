//
//  BottomDetailPanel.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 22/12/25.
//

import SwiftUI

struct BottomDetailPanel: View {
    let item: Item
    @Binding var selectedTab: DetailTab?
    @Binding var selectedDetent: PresentationDetent
    @State private var cartViewModel = CartViewModel.shared
    @Environment(TabRouter.self) private var tabRouter
    @State private var showGoToCartBtn: Bool = false
    
    var body: some View {
        ZStack{
            backgroundView
            VStack(spacing: 10) {
                HStack(spacing: 20) {
                    tabButton(title: "Description", tab: .description)
                    tabButton(title: "Specifications", tab: .specification)
                }
                .padding(.top)
                scrollView
                if selectedTab != nil{
                    if showGoToCartBtn{
                        goToCartView
                    }else{
                        bottomBuyNowBox
                    }
                }
            }
            .presentationCornerRadius(50)
        }
        .onAppear {
            checkItemAlreadyInCart()
        }
    }
}

extension BottomDetailPanel{
    
    func checkItemAlreadyInCart(){
        showGoToCartBtn = cartViewModel.itemPresentInCart(item: item) ? true : false
    }
    
    private var scrollView: some View{
        ScrollView {
            if selectedTab == .description {
                Text(item.description)
                    .font(.body)
                    .padding(20)
                    .frame(maxWidth: .infinity, alignment: .center)
            } else {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(item.specification.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                        HStack {
                            Text(key.capitalized)
                                .foregroundStyle(.secondary)
                            Spacer()
                            Text(value)
                                .bold()
                        }
                    }
                }
                .padding(24)
            }
        }
        .containerRelativeFrame(.horizontal)
    }
    
    private var backgroundView: some View{
        Color(.primaryBackground)
            .ignoresSafeArea()
    }
    
    // MARK: - Reusable Tab Button
    private func tabButton(title: String, tab: DetailTab) -> some View {
        Button {
            withAnimation(.none) {
                selectedTab = tab
            }
            DispatchQueue.main.async {
                selectedDetent = .medium
            }
        } label: {
            tabImage(for: tab)
        }
    }
    
    @ViewBuilder
    private func tabImage(for tab: DetailTab) -> some View {
        let isSelected = selectedTab == tab

        Image(
            isSelected
            ? (tab == .description ? .descriptionSelected : .specificationSelected)
            : (tab == .description ? .description : .specifications)
        )
    }
    
    private var bottomBuyNowBox: some View{
        ZStack(alignment: .center){
            Image(.buyNowBG)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 120)
            HStack(alignment: .center){
                Text(item.price.toCurrencyString())
                    .font(.system(size: 24, weight: .regular))
                    .foregroundStyle(Color(red: 61/255.0, green: 156/255.0, blue: 234/255.0))
                Spacer()
                    .frame(width: 60)
                Button {
                    cartViewModel.addItemToCart(item: item)
                    showGoToCartBtn = true
                    
                } label: {
                    Image(.addToCart)
                        .frame(width: 160)
                }
            }
            .frame(maxWidth: .infinity)
            .offset(y: 10)
        }
    }
    
    private var goToCartView: some View{
        ZStack(alignment: .center){
            Button {
                tabRouter.selectedTab = .cart
            } label: {
                HStack(spacing: 8) {
                        Image(systemName: "cart.fill")
                        Text("View Cart")
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.white)
                    .padding(.vertical, 15)
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity)
                    .clipShape(Capsule())
                    .background(.blue)
            }
            
        }
    }

}



#Preview {
    BottomDetailPanel(
            item: Item.default,
            selectedTab: .constant(.description),
            selectedDetent: .constant(.medium)
        )
    .environment(TabRouter())
    }
