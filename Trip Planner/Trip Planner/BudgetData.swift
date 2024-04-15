//
//  BudgetData.swift
//  Trip Planner
//
//  Created by Julia Woeste on 4/5/24.
//

import Foundation
import SwiftData

@Model
final class BudgetData{
    var budget: Int
    var spent: Int
    var leftover: Int
    var name: String
    var cost: Int
    
    init(budget: Int, spent: Int, leftover: Int, name: String, cost: Int){
        self.budget = budget
        self.spent = spent
        self.leftover = leftover
        self.name = name
        self.cost = cost
    }
}
