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
    let price: String
    let description: String
    let specification: [String: String]
}

