//
//  iExpenseView.swift
//  iExpense
//
//  Created by William Boles on 27/05/2025.
//


import SwiftUI
import SwiftData

@Model
class ExpenseItem {
    var id = UUID()
    var name: String
    var type: String
    var amount: Double
    
    init(id: UUID = UUID(), name: String, type: String, amount: Double) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
    }
}

extension ExpenseItem {
    static let alphabeticOrder: [SortDescriptor] = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount)
    ]
    
    static let amountOrder: [SortDescriptor] = [
        SortDescriptor(\ExpenseItem.amount),
        SortDescriptor(\ExpenseItem.name)
    ]
}

extension ExpenseItem {
    static let all: Predicate<ExpenseItem> = #Predicate<ExpenseItem> { $0.type == "Personal" || $0.type == "Business" }
    static let personal: Predicate<ExpenseItem> = #Predicate<ExpenseItem> { $0.type == "Personal" }
    static let business: Predicate<ExpenseItem> = #Predicate<ExpenseItem> { $0.type == "Business" }
}

struct iExpenseView: View {
    @State private var showingAddExpense = false
    @State private var alphabeticOrder = true
    @State private var sortOrder = ExpenseItem.alphabeticOrder
    @State private var filterSeletion = "All"
    @State private var filter = ExpenseItem.all
    
    var body: some View {
        NavigationStack {
            ExpensesListView(filter: filter, sortOrder: sortOrder)
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                   showingAddExpense = true
                }
                
                Button(alphabeticOrder ? "Order by Amount" : "Order by Name", systemImage: alphabeticOrder ? "dollarsign" : "character") {
                    alphabeticOrder.toggle()
                }
                
                Menu("Filter") {
                    Picker("Filter by", selection: $filterSeletion) {
                        Text("All").tag("All")
                        Text("Personal Only").tag("Personal")
                        Text("Business Only").tag("Business")
                    }
                }
                .onChange(of: filterSeletion) { oldValue, newValue in
                    if newValue == "Personal" {
                        filter = ExpenseItem.personal
                    } else if newValue == "Business" {
                        filter = ExpenseItem.business
                    } else {
                        filter = ExpenseItem.all
                    }
                }
                .onChange(of: alphabeticOrder) { oldValue, newValue in
                    sortOrder = alphabeticOrder ? ExpenseItem.alphabeticOrder : ExpenseItem.amountOrder
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                iExpenseAddView()
            }
        }
    }
}

struct ExpensesListView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpenseItem]
    
    init(filter: Predicate<ExpenseItem>,
         sortOrder: [SortDescriptor<ExpenseItem>]) {
        _expenses = Query(filter: filter, sort: sortOrder)
    }
    
    var body: some View {
        List {
            ForEach(expenses) { item in
                ExpenseItemCellView(item: item)
            }
            .onDelete { removeItems(at: $0, from: expenses) }
        }
    }
    
    func removeItems(at offset: IndexSet, from items: [ExpenseItem]) {
        let expenseItemsToBeDeleted = offset.map { items[$0] }
        
        for expenseItem in expenseItemsToBeDeleted {
            modelContext.delete(expenseItem)
        }
        
        try? modelContext.save()
    }
}

struct ExpenseItemCellView: View {
    let item: ExpenseItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.type)
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
    iExpenseView()
}
