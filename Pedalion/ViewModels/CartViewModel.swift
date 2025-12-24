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
    var orderVM = OrdersViewModel.shared
    var totalPrice: Double = 0.0
    
    func remove(item: Item){
        numberOfItems.removeValue(forKey: item.id)
        cartItems.removeAll { $0.id == item.id }
    }
    
    func addItemToCart(item: Item){
        cartItems.append(item)
        numberOfItems[item.id] = 1
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
            let quantity = numberOfItems[item.id] ?? 0
            total += (item.price * Double(quantity))
        }
        return total
    }
    
    func calculateDiscountedPrice(discount: Double) -> Double{
        let subTotal = calculateSubtotal()
        totalPrice = (subTotal * (100 - discount)) / 100.0
        return totalPrice
    }
    
    func clearItems(){
        cartItems = []
        numberOfItems = [:]
        totalPrice = 0.0
    }
    
    func generateOrderID() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMddHHmmss"
        let dateString = formatter.string(from: Date())
        let random = Int.random(in: 100...999)
        return "ORD-\(dateString)-\(random)"
    }
    
    func addOrder(name: String, phone: String, email: String, address: String){
        let order = Order(id: generateOrderID(), items: cartItems, quantities: numberOfItems, totalAmount: totalPrice, customerInfo: Customer(name: name, phoneNumber: phone, email: email, address: address))
        orderVM.orders.append(order)
    }
}
