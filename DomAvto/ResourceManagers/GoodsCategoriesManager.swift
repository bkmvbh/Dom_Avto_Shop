//
//  GoodsCategoriesManager.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 01.05.2024.
//

import Foundation

class GoodsCategoriesManager {
    
    let data: [GoodsCategories] = [
        GoodsCategories(image: "discs", name: "Диски", type: .disks),
        GoodsCategories(image: "Масло", name: "Масла", type: .oils),
        GoodsCategories(image: "chemistry", name: "Автохимия", type: .autochemistry),
        GoodsCategories(image: "light", name: "Автосвет", type: .autolight),
        GoodsCategories(image: "carpets", name: "Коврики", type: .rugs),
        GoodsCategories(image: "brake", name: "Автозапчасти", type: .autoParts),
        GoodsCategories(image: "winter", name: "Зимние автотовары", type: .winterAutoProducts),
        GoodsCategories(image: "sound", name: "Тюнинг", type: .tuning),
        GoodsCategories(image: "tools", name: "Автоинструменты", type: .autoTools),
        GoodsCategories(image: "battery", name: "Аккумуляторы", type: .batteries),
        GoodsCategories(image: "obd", name: "Автоэлектроника", type: .autoelectronics),
        GoodsCategories(image: "souvenir", name: "Автосувениры", type: .carSouvenirs),
    ]
}
