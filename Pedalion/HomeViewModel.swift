//
//  HomeViewModel.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 21/12/25.
//

import Foundation

@MainActor
@Observable
class HomeViewModel{
    var items: [Item] = []
    var filterItems: [Item] = []
    let categoryButtons: [CategoryButton] = [
        CategoryButton(id: 1, normalImage: .allItems, selectedImage: .allItemsSelected, yOffset: 0, category: .all),
        CategoryButton(id: 2, normalImage: .electric, selectedImage: .electricSelected, yOffset: -20, category: .electrical),
        CategoryButton(id: 3, normalImage: .road, selectedImage: .roadSelected, yOffset: -40, category: .road),
        CategoryButton(id: 4, normalImage: .mountain, selectedImage: .mountainSelected, yOffset: -60, category: .mountain),
        CategoryButton(id: 5, normalImage: .accessory, selectedImage: .accessorySelected, yOffset: -80, category: .accessory)
    ]
    init(){
        loadProducts()
    }
    
    func loadProducts(){
        guard let url = Bundle.main.url(forResource: "ProductDetails", withExtension: "json") else {
            print("❌ ProductDetails.json not found")
            return
        }
        
        do{
            let data = try Data(contentsOf: url)
            let decodedItems = try JSONDecoder().decode([Item].self, from: data)
            items = decodedItems
            filterItems = decodedItems
        } catch{
            print("error\(error.localizedDescription)")
        }
    }
    
    func categoryBtnTapped(btn: CategoryButton){
        filterItems(category: btn.category)
    }
    
    func filterItems(category: FilterCategory){
        if category == .all{
            self.filterItems = items
        }else{
            self.filterItems = items.filter({ item in
                item.itemType.lowercased().contains(category.rawValue.lowercased())
            })
        }
    }
}
