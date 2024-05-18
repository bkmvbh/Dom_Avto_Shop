//
//  DataBaseManager.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 01.05.2024.
//

import Foundation
import UIKit

class DataBaseManager {
    
    private var dataSource: [Tasks] = [
        Tasks(title: "Шарафутдинов Ильмир"),
        Tasks(title: "Добавить Карту"),
        Tasks(title: "Мои Заказы"),
        Tasks(title: "Информация об учетной записи"),
        Tasks(title: "Поддержка"),
        Tasks(title: "Выйти")
    ]
    
    func getAllTasks() -> [Tasks] {
        return dataSource
    }
    
    func removeTask(at index: Int) {
        dataSource.remove(at: index)
    }
    
    func update(task: Tasks) {
        guard let index = dataSource.firstIndex(where: { $0.id == task.id }) else { return }
        dataSource.remove(at: index)
        dataSource.insert(task, at: index)
    }
    
    func insert(task: Tasks, at index: Int) {
        dataSource.insert(task, at: index)
    }
}
