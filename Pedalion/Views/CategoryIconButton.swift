//
//  CategoryIconButton.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 22/12/25.
//

import SwiftUI

struct CategoryIconButton: View {
    @Environment(HomeViewModel.self) private var viewModel
    let item: CategoryButton
    let action: () -> Void

    var isSelected: Bool {
        viewModel.selectedBtnId == item.id
    }

    var body: some View {
        Button {
            viewModel.selectedBtnId = item.id
            action()
        } label: {
            Image(isSelected ? item.selectedImage : item.normalImage)
                .scaleEffect(isSelected ? 1.2 : 1.0)
        }
        .offset(y: item.yOffset)
        .animation(.spring(response: 0.4, dampingFraction: 0.7), value: viewModel.selectedBtnId)
        
    }
}


#Preview {
    //CategoryIconButton()
}
