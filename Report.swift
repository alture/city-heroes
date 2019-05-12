//
//  Report.swift
//  AppName
//
//  Created by Redemax on 5/12/19.
//  Copyright © 2019 Alisher Altore. All rights reserved.
//

import Foundation

struct Report: CustomDebugStringConvertible, Codable {
    
    enum Category: Int, Codable {
        case first = 1, second, third
    }
    
    private(set) var category: Category
    private(set) var imageURLs = [URL]()
    private(set) var description: String = ""
    private(set) var votes = 0
    private(set) var isSolved = false
    
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    mutating func addVote() {
        votes += 1
    }
    
    mutating func deleteVote() {
        votes -= 1
    }
    
    mutating func reportIsSolved() {
        isSolved = true
    }
    
    init(category: Category, imageURLs: [URL], description: String) {
        self.category = category
        self.imageURLs = imageURLs
        self.description = description
    }
    
    init?(jsonData: Data) {
        if let newValue = try? JSONDecoder().decode(Report.self, from: jsonData) {
            self = newValue
        } else {
            return nil
        }
    }
    
    var debugDescription: String {
        return "imageURLs: \(imageURLs), description: \(description), votes: \(votes), isSolved: \(isSolved)"
    }
    
}
