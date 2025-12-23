//
//  Item.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 21/12/25.
//

import Foundation

struct Item: Codable, Identifiable, Hashable{
    let id: Int
    let imageName: String
    let itemType: String
    let itemName: String
    let price: Double
    let description: String
    let specification: [String: String]
    var isFavourite: Bool?
    
    #if DEBUG
    static let `default` = Item(id: 1, imageName: "Bicycle1", itemType: "Road bike", itemName: "PEUGEOT - LR01", price: 1999.99, description: "The PEUGEOT LR01 is a lightweight performance-oriented road bike engineered for riders who value speed and endurance. Its carbon fiber construction ensures excellent stiffness while keeping overall weight low for efficient climbing. The bike offers smooth handling, making it suitable for long-distance rides and high-speed descents. Designed with comfort in mind, it reduces road vibrations on extended journeys. The aerodynamic frame geometry helps maintain momentum with less effort. Whether you are training seriously or riding competitively, this bike delivers consistent performance. It is ideal for riders looking to push their limits on paved roads. The LR01 balances precision, durability, and comfort in one refined package.", specification: [
        "frame": "Carbon Fiber",
        "gears": "22-Speed",
        "brakes": "Hydraulic Disc",
        "weight": "8.2 kg"
    ], isFavourite: false)
    
    #endif
}

