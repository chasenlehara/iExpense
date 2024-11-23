//
//  ContentView.swift
//  iExpense
//
//  Created by Chasen Le Hara on 11/1/24.
//

import SwiftData
import SwiftUI

//@Observable
//class Expenses {
//    var items = [ExpenseItem]() {
//        didSet {
//            if let encoded = try? JSONEncoder().encode(items) {
//                UserDefaults.standard.set(encoded, forKey: "Items")
//            }
//        }
//    }
//    init() {
//        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
//            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
//                items = decodedItems
//                return
//            }
//        }
//
//        items = []
//    }
//    var businessItems: [ExpenseItem] {
//        return self.items.filter { $0.type == "Business" }
//    }
//    var personalItems: [ExpenseItem] {
//        return self.items.filter { $0.type == "Personal" }
//    }
//}

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \ExpenseItem.name) var expenseItems: [ExpenseItem]

    @State private var showingAddExpense = false
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount),
    ]

    var body: some View {
        NavigationStack {
            ExpensesView(sortOrder: sortOrder)
            .navigationTitle("iExpense")
            .toolbar {
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\ExpenseItem.name),
                                SortDescriptor(\ExpenseItem.amount),
                            ])

                        Text("Sort by Amount")
                            .tag([
                                SortDescriptor(\ExpenseItem.amount),
                                SortDescriptor(\ExpenseItem.name)
                            ])
                    }
                }
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView()
        }
    }
}

#Preview {
    ContentView()
}
