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
    
    func getNotificationSettings() async -> UNNotificationSettings {
        await notificationCenter.notificationSettings()
    }
    
    func scheduleNotification(title: String, body: String, timeInterval: TimeInterval) {
            let content = UNMutableNotificationContent()
            content.title = title
            content.body = body
            content.sound = .default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            notificationCenter.add(request) { error in
                if let error = error {
                    print("Error adding notification: \(error.localizedDescription)")
                }
            }
        }

        func scheduleRepeatingNotification(title: String, body: String, timeInterval: TimeInterval) {
            let content = UNMutableNotificationContent()
            content.title = title
            content.body = body
            content.sound = .default

            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: true)
            let request = UNNotificationRequest(identifier: "repeatingNotification", content: content, trigger: trigger)
            
            notificationCenter.add(request) { error in
                if let error = error {
                    print("Error adding repeating notification: \(error.localizedDescription)")
                }
            }
        }
    }
