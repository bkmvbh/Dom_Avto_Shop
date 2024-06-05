//
//  DataBaseManager.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 01.05.2024.
//

import Foundation
import UIKit

class DataBaseManager {
    static let shared = DataBaseManager()
    
    var dataSource: [Goods] = []
    var shoppingCart: [String] = []
    
    func getAllTasks() -> [Goods] {
        return dataSource
    }
    
    func removeGood(at id: String) {
        shoppingCart.removeAll(where: { $0 == id })
    }
    
    func update(goods: Goods) {
        guard let index = dataSource.firstIndex(where: { $0.id == goods.id }) else { return }
        dataSource.remove(at: index)
        dataSource.insert(goods, at: index)
    }
    
    func addGoodToCart(by id: String) {
        if shoppingCart.contains(id) == false {
            shoppingCart.append(id)
        }
    }
}
