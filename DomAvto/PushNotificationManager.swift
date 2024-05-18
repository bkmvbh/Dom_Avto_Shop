//
//  PushNotificationManager.swift
//  DomAvto
//
//  Created by Ильмир Шарафутдинов on 09.05.2024.
//

import Foundation
import UserNotifications

class PushNotificationManager {
    
    private let notificationCenter = UNUserNotificationCenter.current()
    
    func registerForNotifications () async throws -> Bool {
        try await notificationCenter.requestAuthorization (options: [.alert, .badge, .sound])
    }
}
