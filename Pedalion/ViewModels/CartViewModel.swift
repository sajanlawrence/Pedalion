//
//  CartViewModel.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 23/12/25.
//

import Foundation

@MainActor
@Observable
class CartViewModel{
    static let shared = CartViewModel()
    private init(){}
    var cartItems: [Item] = [.default, Item(id: 6, imageName: "Bicycle1", itemType: "Electrical", itemName: "bike", price: "", description: "", specification: [:])]
    
    func remove(item: Item){
        cartItems.removeAll { $0.id == item.id }
    }
}
