//
//  User+CoreDataProperties.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 28.03.2024.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var password: String?
    @NSManaged public var name: String?
    @NSManaged public var email: String?

}

extension User : Identifiable {

}
