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
    var cartItems: [Item] = []
    var numberOfItems: [Int : Int] = [:]
    
    func remove(item: Item){
        cartItems.removeAll { $0.id == item.id }
    }
    
    func addItemToCart(item: Item){
        cartItems.append(item)
    }
    
    func itemPresentInCart(item: Item) -> Bool{
        guard let _ = cartItems.first(where: { $0.id == item.id }) else{
            return false
        }
        return true
    }
    
    func checkValidCoupon(coupon: String) -> Bool{
        return coupon == "BIKE" ? true : false
    }
    
    func calculateSubtotal() -> Double{
        var total = 0.0
        for item in cartItems {
            let quantity = numberOfItems[item.id] ?? 1
            total += (item.price * Double(quantity))
        }
        return total
    }
    
    func calculateDiscountedPrice(discount: Double) -> Double{
        let subTotal = calculateSubtotal()
        let discountedPrice = (subTotal * (100 - discount)) / 100.0
        return discountedPrice
    }
}
