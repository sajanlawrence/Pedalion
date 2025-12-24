//
//  OrdersViewModel.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 24/12/25.
//

import Foundation

@MainActor
@Observable
class OrdersViewModel{
    static let shared = OrdersViewModel()
    private init() {}
    var orders: [Order] = []
}

