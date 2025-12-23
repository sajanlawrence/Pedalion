//
//  ProductDetailView.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 22/12/25.
//

import SwiftUI

enum DetailTab {
    case description
    case specification
}

struct ProductDetailView: View {
    let product: Item
    @Environment(HomeViewModel.self) private var viewModel
    @State private var selectedTab: DetailTab? = nil
    @State private var selectedDetent: PresentationDetent = .height(30)
    @State private var isFavourite: Bool = false
    
    
    var body: some View {
        ZStack {
            backgroundView
            
            VStack {
                headerView
                
                Spacer()
                
                Image(product.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: selectedTab == nil ? 280 : 220)
                    .padding(.horizontal, 40)
                
                Spacer()
                BottomDetailPanel(item: product,
                                  selectedTab: $selectedTab,
                                  selectedDetent: $selectedDetent)
                .frame(height: selectedTab == nil ? 100 : 400)
                .presentationDetents(
                                [.height(30)],
                                selection: $selectedDetent
                            )
                .presentationDragIndicator(.visible)
            }
        }
        .onAppear{
            isFavourite = product.isFavourite ?? false
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

extension ProductDetailView{
    
    @ViewBuilder
    private var headerView: some View{
        HStack(alignment: .center){
            Text(product.itemName)
                .foregroundStyle(.white)
                .font(.system(size: 25, weight: .bold))
        }
        .frame(maxWidth: 350)
        .padding(.horizontal)
        .padding(.top)
        HStack{
            Spacer()
            Button {
                viewModel.updateFavourite(item: product)
                isFavourite.toggle()
            } label: {
                Image(systemName: isFavourite ? "heart.fill" : "heart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .padding(.horizontal, 30)
                    
            }
        }
        .frame(maxWidth: UIScreen.main.bounds.width)
    }
    
    private var backgroundView: some View{
        Group{
            Color(.primaryBackground)
                .ignoresSafeArea()
            Rectangle()
                .rotation(Angle(degrees: 30))
                .foregroundStyle(LinearGradient(colors: [.blue, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 600, height: 800)
                .offset(x: 120, y: 200)
        }
    }
}

#Preview {
    ProductDetailView(product: Item.default)
}
