//
//  AddView.swift
//  iExpense
//
//  Created by William Boles on 27/05/2025.
//

import SwiftUI
import SwiftData

struct iExpenseAddView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = types[0]
    @State private var amount = 0.0
        
    static let types = ["Personal", "Business"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(iExpenseAddView.types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let expense = ExpenseItem(name: name, type: type, amount: amount)
                    modelContext.insert(expense)
                    
                    try? modelContext.save()
                    
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    iExpenseAddView()
}
