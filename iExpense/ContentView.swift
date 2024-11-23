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
    @Query var expenseItems: [ExpenseItem]

    @State private var showingAddExpense = false

    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink("Add new expense") {
                        AddView()
                    }
                }

                ForEach(expenseItems) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }

                        Spacer()
                        Text(item.amount, format: .currency(code: item.currencyCode))
                            .foregroundStyle(item.amount < 10 ? .orange : item.amount < 100 ? .blue : .purple)
                    }
                }
                .onDelete(perform: removeItems)
                
//                Section("Business") {
//                        ForEach(expenses.businessItems) { item in
//                            HStack {
//                                VStack(alignment: .leading) {
//                                    Text(item.name)
//                                        .font(.headline)
//                                    Text(item.type)
//                                }
//
//                                Spacer()
//                                Text(item.amount, format: .currency(code: item.currencyCode))
//                                    .foregroundStyle(item.amount < 10 ? .orange : item.amount < 100 ? .blue : .purple)
//                            }
//                        }
//                        .onDelete(perform: removeItemsFromBusiness)
//                }
//                
//                Section("Personal") {
//                        ForEach(expenses.personalItems) { item in
//                            HStack {
//                                VStack(alignment: .leading) {
//                                    Text(item.name)
//                                        .font(.headline)
//                                    Text(item.type)
//                                }
//
//                                Spacer()
//                                Text(item.amount, format: .currency(code: item.currencyCode))
//                                    .foregroundStyle(item.amount < 10 ? .orange : item.amount < 100 ? .blue : .purple)
//                            }
//                        }
//                        .onDelete(perform: removeItemsFromBusiness)
//                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView()
        }
    }
    func removeItems(at offsets: IndexSet) {
//        expenses.items.remove(atOffsets: offsets)
    }
    func removeItemsFromBusiness(at offsets: IndexSet) {
//        let thisItem = expenses.businessItems[offsets.first!]
//        let indexInMainList = expenses.items.firstIndex(of: thisItem)
//        self.removeItems(at: IndexSet(integer: indexInMainList!))
    }
    func removeItemsFromPersonal(at offsets: IndexSet) {
//        let thisItem = expenses.personalItems[offsets.first!]
//        let indexInMainList = expenses.items.firstIndex(of: thisItem)
//        self.removeItems(at: IndexSet(integer: indexInMainList!))
    }
}

#Preview {
    ContentView()
}
