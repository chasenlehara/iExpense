//
//  ExpensesView.swift
//  iExpense
//
//  Created by Chasen Le Hara on 11/22/24.
//

import SwiftData
import SwiftUI

struct ExpensesView: View {
    @Query var expenses: [ExpenseItem]
    
    init(expenseType: ExpenseType, sortOrder: [SortDescriptor<ExpenseItem>]) {
        let expenseTypeString: String
        switch expenseType {
        case .business:
            expenseTypeString = "Business"
        case .personal:
            expenseTypeString = "Personal"
        default:
            expenseTypeString = ""
        }
        
        _expenses = Query(
            filter: #Predicate<ExpenseItem> { expenseItem in
                expenseTypeString.isEmpty || expenseItem.type == expenseTypeString
            },
            sort: sortOrder
        )
    }
    var body: some View {
                ForEach(expenses) { item in
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
    ExpensesView(expenseType: .all, sortOrder: [SortDescriptor(\ExpenseItem.name)])
        .modelContainer(for: ExpenseItem.self)
}
