//
//  FetchGoodsManager.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 04.06.2024.
//

import Foundation

class FetchGoodsManager {
    private var goodsArray: [Goods] = []
    
    func fetchGoods(completion: (([Goods]) -> ())? = nil) {
        guard let url = URL(string: "https://66489d122bb946cf2fa11d55.mockapi.io/Api/get-Goods") else {
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, _ in
            guard let data, let self else { return }
            self.handleResponse(with: data, completion: completion)
        }
        task.resume()
    }
    
    func handleResponse(with data: Data, completion: (([Goods]) -> ())?  = nil) {
        let goods = try? JSONDecoder().decode([Goods].self, from: data)
        self.goodsArray = goods ?? []
        completion?(self.goodsArray)
    }
}
