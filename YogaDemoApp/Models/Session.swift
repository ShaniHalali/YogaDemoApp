//
//  Session.swift
//  YogaDemoApp
//
//  Created by ShaniHalali on 27/12/2025.
//
import Foundation

struct SessionResponse: Codable {
    let array: [SessionItem]
}

// MARK: - Array
struct SessionItem: Identifiable, Codable {
    let length: Int
    let quoteAuthor, quote: String
    let chapterName: ChapterName
    let chapter: Int
    let difficulty: Difficulty
    var id: UUID {
        UUID()
    }

}


enum ChapterName: String, Codable {
    case earthPractice = "Earth Practice"
    case neckShouldersAwakening = "Neck & Shoulders Awakening"
    case riseUp = "Rise Up"
}
 

enum Difficulty: String, Codable {
    case easy = "Easy"
    case hard = "Hard"
    case medium = "Medium"
}

