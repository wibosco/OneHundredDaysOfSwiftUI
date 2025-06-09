//
//  ContentView.swift
//  iExpense
//
//  Created by William Boles on 27/05/2025.
//


import SwiftUI

//By using Identifiable we can remove the `id` parameter from the ForEach
struct ExpenseItem: Identifiable, Codable {
    enum ExpenseItemType: String, Codable, CaseIterable {
        case personal = "Personal"
        case business = "Business"
    }
    
    let id = UUID()
    let name: String
    let type: ExpenseItemType
    let amount: Double
    
    enum CodingKeys: CodingKey {
        case name
        case type
        case amount
    }
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    var personalItems: [ExpenseItem] {
        return items.filter { $0.type == .personal }
    }
    
    var businessItems: [ExpenseItem] {
        return items.filter { $0.type == .business }
    }
    
    init() {
        guard let data = UserDefaults.standard.data(forKey: "Items"),
        let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: data) else {
            return
        }
        
        items = decodedItems
    }
}

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                if !expenses.personalItems.isEmpty {
                    Section("Personal") {
                        ForEach(expenses.personalItems) { item in
                            ExpenseItemCellView(item: item)
                        }
                        .onDelete { removeItems(at: $0, from: expenses.personalItems) }
                    }
                }
                
                if !expenses.businessItems.isEmpty {
                    Section("Business") {
                        ForEach(expenses.businessItems) { item in
                            ExpenseItemCellView(item: item)
                        }
                        .onDelete { removeItems(at: $0, from: expenses.businessItems) }
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                   showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offset: IndexSet, from items: [ExpenseItem]) {
        let expenseItemsToBeDeleted = offset.map { items[$0] }
        
        for expenseItem in expenseItemsToBeDeleted {
            expenses.items.removeAll { $0.id == expenseItem.id }
        }
    }
}

struct ExpenseItemCellView: View {
    let item: ExpenseItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.type.rawValue)
            }
            
            Spacer()
            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
        }
        .foregroundStyle(colorForExpenseItem(item))
    }
    
    func colorForExpenseItem(_ expenseItem: ExpenseItem) -> Color {
        if expenseItem.amount < 10 {
            return .blue
        } else if expenseItem.amount >= 10 && expenseItem.amount < 100 {
            return .green
        } else {
            return .red
        }
    }
}

#Preview {
    ContentView()
}
