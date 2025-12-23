//
//  ProductRowView.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 23/12/25.
//

import SwiftUI

struct ProductRowView: View {
    let item: Item
    @State private var numberOfItems = 1
    
    var body: some View {
        
        HStack(spacing: 12) {
            ZStack {
                Image(.productBG)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)
                
                Image(item.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(item.itemName)
                    .bold()
                    .foregroundStyle(.white)
                
                Text(item.itemType)
                    .foregroundStyle(.secondary)
                
                Text(item.price)
                    .foregroundStyle(Color(
                        red: 61/255,
                        green: 156/255,
                        blue: 234/255
                    ))
            }
            
            Spacer()
            
            HStack(spacing: 12) {
                Button {
                    numberOfItems = max(1, numberOfItems - 1)
                } label: {
                    Image(systemName: "minus")
                        .frame(width: 24, height: 24)
                        .contentShape(Rectangle())
                }
                Text("\(numberOfItems)")
                    .font(.subheadline)
                    .foregroundStyle(.white)
                
                Button {
                    numberOfItems += 1
                } label: {
                    Image(systemName: "plus")
                        .frame(width: 24, height: 24)
                        .contentShape(Rectangle())
                }
                
            }
            
            .padding(10)
            .background(.black.opacity(0.25))
            .clipShape(Capsule())
        }
        .padding(.horizontal, 12)
        .frame(height: 120)
        .background(Color.primaryBackground)
    }
    
}


#Preview {
    ProductRowView(item: Item.default)
}
