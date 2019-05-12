//
//  Report.swift
//  AppName
//
//  Created by Redemax on 5/12/19.
//  Copyright © 2019 Alisher Altore. All rights reserved.
//

import Foundation

struct Report: CustomDebugStringConvertible, Codable {
    private(set) var imageURLs = [URL]()
    private(set) var title: String = ""
    private(set) var description: String = ""
    private(set) var votes = 0
    private(set) var isSolved = false
    var longitude: Double = 0.0
    var latitude: Double = 0.0

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
    
    init(imageURLs: [URL], title: String, description: String) {
        self.title = title
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
        return "imageURLs: \(imageURLs), title: \(title), description: \(description), votes: \(votes), isSolved: \(isSolved)"
    }
    
}
