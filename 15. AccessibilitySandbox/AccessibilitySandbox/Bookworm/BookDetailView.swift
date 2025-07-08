//
//  BookDetailView.swift
//  Bookworm
//
//  Created by William Boles on 09/06/2025.
//

import SwiftUI
import SwiftData

struct BookDetailView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    let book: Book
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre.uppercased())
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(book.author)
                    .font(.title)
                    .foregroundStyle(.secondary)
                
                RatingView(rating: .constant(book.rating)) //.constant() is a way of setting a binding that will not change
                    .font(.largeTitle)
                
                Text(book.dateRead.formatted(.dateTime
                    .year()
                    .month()
                    .day()))
                .font(.caption)
                
                Text(book.review)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .alert("Delete book", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button("Delete this book", systemImage: "trash") {
                showingDeleteAlert = true
            }
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    }
    
    func deleteBook() {
        modelContext.delete(book)
        try? modelContext.save()
        dismiss()
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self,
                                           configurations: config)
        let example = Book(title: "Test Book", author: "Test Author", genre: "Fantasy", review: "This was a great book; I really enjoyed it.", rating: 4, dateRead: .now)
        
        return BookDetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
