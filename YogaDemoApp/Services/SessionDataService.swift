//
//  SessionDataService.swift
//  YogaDemoApp
//
//  Created by ShaniHalali on 27/12/2025.
//

import Foundation

struct SessionDataService {
    static func loadSessions() -> [SessionItem] {
        guard let url = Bundle.main.url(forResource: "sessions", withExtension: "json") else {
            print("JSON file not found in bundle")
            return []
        }

        guard let data = try? Data(contentsOf: url) else {
            print("Failed to load data from file")
            return []
        }

        guard let decoded = try? JSONDecoder().decode(SessionResponse.self, from: data) else {
            print("Failed to decode JSON ")
            return []
        }

        print("Decoded sessions count: \(decoded.array)")
        return decoded.array
    }
}
