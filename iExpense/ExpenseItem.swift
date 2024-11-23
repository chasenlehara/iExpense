//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Chasen Le Hara on 11/22/24.
//

import Foundation
import SwiftData

@Model
class ExpenseItem {// Identifiable, Codable, Equatable
    var id: UUID
    var currencyCode: String
    var name: String
    var type: String
    var amount: Double
    
    init(id: UUID = UUID(), currencyCode: String = "USD", name: String, type: String, amount: Double) {
        self.id = id
        self.currencyCode = currencyCode
        self.name = name
        self.type = type
        self.amount = amount
    }
}
