//
//  AddView.swift
//  iExpense
//
//  Created by Chasen Le Hara on 11/1/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var currencyCode = "USD"
    @State private var type = "Personal"
    @State private var amount = 0.0
    var expenses: Expenses

    let currencyCodes = ["AUD", "CAD", "CHF", "CNY", "DKK", "EUR", "GBP", "HKD", "INR", "JPY", "MXN", "MYR", "NOK", "NZD", "PHP", "RUB", "SEK", "SGD", "THB", "TRY", "USD", "ZAR"]
    let types = ["Business", "Personal"]

    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                Picker("Currency", selection: $currencyCode) {
                    ForEach(currencyCodes, id: \.self) {
                        Text($0)
                    }
                }

                TextField("Amount", value: $amount, format: .currency(code: currencyCode))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let item = ExpenseItem(name: name, type: type, amount: amount)
                        expenses.items.append(item)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
