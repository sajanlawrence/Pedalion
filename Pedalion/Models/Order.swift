//
//  Order.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 24/12/25.
//

import Foundation

struct Order: Identifiable, Hashable, Comparable{
    static func < (lhs: Order, rhs: Order) -> Bool {
        lhs.dateOfOrder > rhs.dateOfOrder
    }
    
    let id: String
    let dateOfOrder = Date()
    let items: [Item]
    let quantities: [Int : Int]
    let totalAmount: Double
    let customerInfo: Customer
    
    #if DEBUG
    static let `default` = Order(id: "ORD-20250824143055-742", items: [.default], quantities: [30 : 2], totalAmount: 1200.0, customerInfo: .default)
    #endif
}

struct Customer: Identifiable, Hashable{
    let id = UUID()
    let name: String
    let phoneNumber: String
    let email: String
    let address: String
    
    #if DEBUG
    static let `default` = Customer(name: "Sajan", phoneNumber: "123456789", email: "abc@gmail.com", address: "ABC House, 2nd Cross street, India")
    #endif
}
