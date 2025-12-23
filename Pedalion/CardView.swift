//
//  CardView.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 21/12/25.
//

import SwiftUI

struct CardView: View {
    let item: Item
    var body: some View {
        ZStack{
            Image(.itemBackground)
                .resizable()
                .frame(width: 165, height: 241)
            VStack(alignment: .center){
                Image(item.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 88)
                Text(item.itemType)
                    .foregroundStyle(.gray)
                    .font(.system(size: 13, weight: .medium))
                Text(item.itemName)
                    .foregroundStyle(.white)
                    .frame(width: 160)
                    .font(.system(size: 15, weight: .bold))
                    .multilineTextAlignment(.center)
                Text(item.price)
                    .foregroundStyle(.white)
                    .font(.system(size: 13, weight: .medium))
            }
        }
    }
}

#Preview {
    CardView(item: Item(id: 1, imageName: "Bicycle1", itemType: "Road", itemName: "Helmet", price: "", description: "", specification: [:]))
}
