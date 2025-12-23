//
//  CategoryButton.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 22/12/25.
//

import Foundation
import SwiftUI

struct CategoryButton: Identifiable, Hashable {
    let id: Int
    let normalImage: ImageResource
    let selectedImage: ImageResource
    let yOffset: CGFloat
    let category: FilterCategory
}
