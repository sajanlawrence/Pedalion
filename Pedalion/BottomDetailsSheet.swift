//
//  BottomDetailsSheet.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 22/12/25.
//

import SwiftUI

struct BottomDetailsSheet: View {
    let item: Item
    @Binding var selectedTab: DetailTab
    var body: some View {
        VStack{
            // 🔘 Tab Buttons
            HStack(spacing: 20) {
                tabButton(title: "Description", tab: .description)
                tabButton(title: "Specifications", tab: .specification)
            }
            .padding(.top)
            Text(selectedTab == .description ? item.description : "item.specification")
        }
        .frame(height: 500)
        //.background(.yellow)
    }
    
    // MARK: - Reusable Tab Button
    private func tabButton(title: String, tab: DetailTab) -> some View {
        Button {
            selectedTab = tab
            //selectedDetent = .large // ✅ Expand on tap
        } label: {
            Text(title)
                .fontWeight(selectedTab == tab ? .bold : .regular)
                .foregroundStyle(selectedTab == tab ? .white : .gray)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(
                    Capsule()
                        .fill(selectedTab == tab ? Color.blue : Color.gray.opacity(0.2))
                )
        }
    }
}

#Preview {
    BottomDetailsSheet(item: Item(id: 1, imageName: "Bicycle1", itemType: "Road", itemName: "Helmet", price: "", description: "New addition to the store", specification: [:]), selectedTab: .constant(.description))
}
