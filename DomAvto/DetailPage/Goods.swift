//
//  Goods.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 18.05.2024.
//

import Foundation

enum TypeEnum: String, Codable {
    case empty = ""
    case autochemistry = "Autochemistry"
    case autolight = "Autolight"
    case disks = "Disks"
    case oils = "Oils"
    case rugs = "Rugs"
    case autoParts = "AutoParts"
    case winterAutoProducts = "WinterAutoProducts"
    case tuning = "Tuning"
    case autoTools = "AutoTools"
    case batteries = "Batteries"
    case autoelectronics = "Autoelectronics"
    case carSouvenirs = "CarSouvenirs"
    
}

struct Goods: Decodable {
    let id: String
    let name: String
    let price: String
    let pastPrice: String
    let descriptions: String
    let type: TypeEnum
    let avatar: String
}
