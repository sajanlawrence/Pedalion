//
//  SwipeRow.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 23/12/25.
//

import SwiftUI

struct SwipeRow<Content: View>: View {
    let content: Content
    let onDelete: () -> Void

    @State private var offsetX: CGFloat = 0

    init(onDelete: @escaping () -> Void, @ViewBuilder content: () -> Content) {
        self.onDelete = onDelete
        self.content = content()
    }

    var body: some View {
        ZStack(alignment: .trailing) {
            Color.red
                .overlay(
                    Image(systemName: "trash")
                        .foregroundColor(.white)
                        .padding(.trailing, 20),
                    alignment: .trailing
                )

            content
                .offset(x: offsetX)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            offsetX = min(0, value.translation.width)
                        }
                        .onEnded { value in
                            if value.translation.width < -80 {
                                withAnimation {
                                    offsetX = -UIScreen.main.bounds.width
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    onDelete()
                                }
                            } else {
                                withAnimation {
                                    offsetX = 0
                                }
                            }
                        }
                )
        }
    }
}


#Preview {
    SwipeRow {
        
    } content: {
        
    }
}
