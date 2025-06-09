//
//  AddBookView.swift
//  Bookworm
//
//  Created by William Boles on 09/06/2025.
//

import SwiftUI
import SwiftData

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var dateRead = Date.now
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    private var disableAddButton: Bool {
        return title.isEmpty || author.isEmpty || review.isEmpty
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Name of book", text: $title)
                TextField("Author's name", text: $author)
                
                Picker("Genre", selection: $genre) {
                    ForEach(genres, id: \.self) {
                        Text($0)
                    }
                }
                
                DatePicker("Date read", selection: $dateRead, in: ...Date(), displayedComponents: .date)
            }
            
            Section("Write a review") {
                TextEditor(text: $review)
                RatingView(rating: $rating)
            }
            
            Section {
                Button("Save") {
                    let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating, dateRead: dateRead)
                    modelContext.insert(newBook)
                    try? modelContext.save()
                    dismiss()
                }
                .disabled(disableAddButton)
            }
        }
        .navigationTitle("Add Book")
    }
}

#Preview {
    AddBookView()
}
