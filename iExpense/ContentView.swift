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

enum ExpenseType: String, Codable {
    case all, business, personal
}

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \ExpenseItem.name) var expenseItems: [ExpenseItem]
    @State private var expenseType: ExpenseType = .all

    @State private var showingAddExpense = false
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount),
    ]

    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink("Add new expense") {
                        AddView()
                    }
                }
                
                Picker("Which expenses?", selection: $expenseType) {
                    Text("All").tag(ExpenseType.all)
                    Text("Business").tag(ExpenseType.business)
                    Text("Personal").tag(ExpenseType.personal)
                }
                .pickerStyle(.segmented)
                
                ExpensesView(expenseType: expenseType, sortOrder: sortOrder)
            }
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
