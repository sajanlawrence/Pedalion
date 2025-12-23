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
    
    var body: some View {
        ZStack{
            backgroundView
            VStack(spacing: 10) {
                HStack(spacing: 20) {
                    tabButton(title: "Description", tab: .description)
                    tabButton(title: "Specifications", tab: .specification)
                }
                .padding(.top)
                ScrollView {
                    if selectedTab == .description {
                        Text(item.description)
                            .font(.body)
                            .padding(24)
                            .frame(maxWidth: .infinity, alignment: .leading)
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
                if selectedTab != nil{
                    ZStack(alignment: .center){
                        Image(.buyNowBG)
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width, height: 120)
                        HStack(alignment: .center){
                            Text(item.price)
                                .font(.system(size: 24, weight: .regular))
                                .foregroundStyle(Color(red: 61/255.0, green: 156/255.0, blue: 234/255.0)
)
                            Spacer()
                                .frame(width: 60)
                            Button {
                                
                            } label: {
                                Image(.addToCart)
                                    .frame(width: 160)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .offset(y: 10)
                    }
                    
                }
            }
            .presentationCornerRadius(50)
        }
    }
    
    private var backgroundView: some View{
        Color(.primaryBackground)
            .ignoresSafeArea()
    }
    
    // MARK: - Reusable Tab Button
    private func tabButton(title: String, tab: DetailTab) -> some View {
        Button {
            // 1️⃣ Update tab instantly (no lag)
            withAnimation(.none) {
                selectedTab = tab
            }

            // 2️⃣ Expand sheet in next run loop
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

}



#Preview {
    //BottomDetailSheet(item: <#Item#>, selectedTab: <#Binding<DetailTab>#>, selectedDetent: <#Binding<PresentationDetent>#>)
}
