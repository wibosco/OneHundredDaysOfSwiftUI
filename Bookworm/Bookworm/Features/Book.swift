//
//  Book.swift
//  Bookworm
//
//  Created by William Boles on 09/06/2025.
//

import Foundation
import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    var dateRead: Date
    
    init(title: String, author: String, genre: String, review: String, rating: Int, dateRead: Date) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
        self.dateRead = dateRead
    }
}
