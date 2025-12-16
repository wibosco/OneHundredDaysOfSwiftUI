//
//  EditCardsView.swift
//  Flashzilla
//
//  Created by William Boles on 15/12/2025.
//

import SwiftUI

struct EditCardsView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var cards = [Card]()
    @State private var newPrompt = ""
    @State private var newAnswer = ""
    
    @FocusState private var isNewPromptFocused: Bool
    @FocusState private var isNewAnswerFocused: Bool
    
    var body: some View {
        NavigationStack {
            List {
                Section("Add new card") {
                    TextField("Prompt", text: $newPrompt)
                        .focused($isNewPromptFocused)
                    TextField("Answer", text: $newAnswer)
                        .focused($isNewAnswerFocused)
                    Button("Add Card", action: addCard)
                }
                
                Section {
                    ForEach(0..<cards.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(cards[index].prompt)
                                .font(.headline)
                            Text(cards[index].answer)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .onDelete(perform: removeCard)
                }
            }
            .navigationTitle("Edit Cards")
            .toolbar {
                Button("Done", action: done)
            }
            .onAppear(perform: loadData)
        }
    }
    
    private func addCard() {
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
        
        guard !trimmedPrompt.isEmpty &&
                !trimmedAnswer.isEmpty else {
            return
        }
        
        let card = Card(prompt: trimmedPrompt,
                        answer: trimmedAnswer)
        cards.insert(card, at: 0)
        
        saveData()
        
        newPrompt = ""
        newAnswer = ""
        
        isNewPromptFocused = false
        isNewAnswerFocused = false
    }
    
    private func removeCard(at offSets: IndexSet) {
        cards.remove(atOffsets: offSets)
        
        saveData()
    }
    
    private func done() {
        dismiss()
    }
    
    private func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decoded
            }
        }
    }
    
    private func saveData() {
        if let data = try? JSONEncoder().encode(cards) {
            UserDefaults.standard.set(data, forKey: "Cards")
        }
    }
}

#Preview {
    EditCardsView()
}
