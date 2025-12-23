//
//  CategoryIconButton.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 22/12/25.
//

import SwiftUI

struct CategoryIconButton: View {
    let item: CategoryButton
    @Binding var selectedId: Int

    var isSelected: Bool {
        selectedId == item.id
    }

    var body: some View {
        Button {
            selectedId = item.id
        } label: {
            Image(isSelected ? item.selectedImage : item.normalImage)
                .scaleEffect(isSelected ? 1.2 : 1.0)
        }
        .offset(y: item.yOffset)
        .animation(.spring(response: 0.4, dampingFraction: 0.7), value: selectedId)
    }
}


#Preview {
    //CategoryIconButton()
}
