//
//  CoreDataManager.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 28.03.2024.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager: NSObject {

    public static let shared = CoreDataManager()
    
    private override init() {}
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
       
        let container = NSPersistentContainer(name: "DomAvto")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
               
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    func obtainSavedData() -> [User] {
        let userFetchRequest = User.fetchRequest()
        let result = try? viewContext.fetch(userFetchRequest)
        
        return result ?? []
    }
}

