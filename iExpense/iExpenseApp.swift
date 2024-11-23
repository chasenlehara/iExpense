//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Chasen Le Hara on 11/1/24.
//

import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
