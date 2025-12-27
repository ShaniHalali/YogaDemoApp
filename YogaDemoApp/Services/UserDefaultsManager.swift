//
//  UserDefaultsManager.swift
//  YogaDemoApp
//
//  Created by ShaniHalali on 27/12/2025.
//

import Foundation

struct UserDefaultsManager {
    private static let doneSessionsKey = "doneSessions"

    static func markSessionAsDone(id: UUID) {
        var current = fetchDoneSessions()
        let idString = id.uuidString
        if !current.contains(idString) {
            current.append(idString)
            UserDefaults.standard.set(current, forKey: doneSessionsKey)
        }
    }

    static func fetchDoneSessions() -> [String] {
        UserDefaults.standard.stringArray(forKey: doneSessionsKey) ?? []
    }

    static func isSessionDone(id: UUID) -> Bool {
        fetchDoneSessions().contains(id.uuidString)
    }

    static func resetDoneSessions() {
        UserDefaults.standard.removeObject(forKey: doneSessionsKey)
    }
}
