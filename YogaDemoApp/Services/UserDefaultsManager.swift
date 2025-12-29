//
//  UserDefaultsManager.swift
//  YogaDemoApp
//
//  Created by ShaniHalali on 27/12/2025.
//

import Foundation

struct UserDefaultsManager {
    private static let doneSessionsKey = "doneSessions"

    static func markSessionAsDone(id: String) {
        var current = fetchDoneSessions()
        let idString = id
        if !current.contains(idString) {
            current.append(idString)
            UserDefaults.standard.set(current, forKey: doneSessionsKey)
        }
    }

    static func fetchDoneSessions() -> [String] {
        UserDefaults.standard.stringArray(forKey: doneSessionsKey) ?? []
    }

    static func isSessionDone(id: String) -> Bool {
        fetchDoneSessions().contains(id)
    }

    static func resetDoneSessions() {
        UserDefaults.standard.removeObject(forKey: doneSessionsKey)
    }
}
