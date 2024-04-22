//
//  Budget.swift
//  Trip Planner
//
//  Created by Julia Woeste on 2/14/24.
//

import SwiftUI
import SwiftData


struct Budget: View {
    @Environment(\.modelContext) var context
    @State private var showSpendingSheet: Bool = false
    @State private var showBudgetSheet: Bool = false
    @Query private var budgeting: [BudgetData]
    @State private var totalBudget: Int = 0
    //let tripdata = NewTripData()

    var totalSpent: Int {
        budgeting.reduce(0) { $0 + $1.cost }
    }
    var budgetLeft: Int {
        totalBudget - totalSpent
    }

    var body: some View {
        VStack {
            Button(action: {
                self.showSpendingSheet = true
            }) {
                Text("New Spending")
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(3)
                    .background(Color.accentColor)
                    .cornerRadius(8)
            }
            .padding(.bottom, 0)
            .foregroundColor(.blue)
            .cornerRadius(8)
            .sheet(isPresented: $showSpendingSheet) {
                NewSpending()
            }

            Button(action: {
                self.showBudgetSheet = true
            }) {
                Text("New Budget")
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(3)
                    .background(Color.accentColor)
                    .cornerRadius(8)
            }
            .padding(.bottom, 12)
            .foregroundColor(.blue)
            .cornerRadius(8)
            .sheet(isPresented: $showBudgetSheet) {
                NewBudget(totalBudget: self.$totalBudget)
            }

            Text("Total Budget: $\(totalBudget)")
                .padding(.top, -20)
                .fontWeight(.medium)
            Text("Total Spent: $\(totalSpent)")
                .padding(.top, 0)
                .fontWeight(.medium)
            Text("Budget Left: $\(budgetLeft)")
                .padding(.top, 0)
                .fontWeight(.medium)

            List {
                ForEach(budgeting, id: \.self) { budgetData in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1)
        
                        HStack{
                            Image(systemName:"dollarsign")
                            VStack{
                                Text("Name: \(budgetData.name) \nCost: \(budgetData.cost)")
                            }
                            .listRowBackground(Color.white)
                        }
                        .padding(.leading, 10)
                        .fontWeight(.light)
                    }
                }
                .onDelete(perform: {indexSet in
                    indexSet.map{budgeting[$0]}.forEach {i in
                        context.delete(i)
                    }
                })
            }
            .listStyle(PlainListStyle())
        }
    }
}

struct NewBudget: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @Binding var totalBudget: Int
    @State private var budget: Int = 0
    @State private var name: String = ""

    var body: some View {
        VStack {
            Form {
                Section("Budget Amount") {
                    TextField("$", value: $budget, format: .number)
                }
            }

            Button("Save") {
                if budget < totalBudget {
                    totalBudget -= (totalBudget - budget)
                } else if budget == 0 {
                    totalBudget = 0
                } else {
                    totalBudget += budget
                }
                dismiss()
            }
            .frame(width:125, height: 40, alignment: .center)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .fontWeight(.medium)
        }
    }
}
struct NewSpending: View{
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @State var budget: Int = 0
    @State var spent: Int = 0
    @State var leftover: Int = 0
    @State var name: String = ""
    @State var cost: Int = 0
    @State var adjustTotalBudget = false

    var body: some View{
        VStack{
            Form{
                Section("Item"){
                    TextField("Name", text: $name)
                }
                Section("Cost"){
                    TextField("$", value: $cost, format: .number)
                }
                
            }
            Button("Save"){
                let newBudget = BudgetData(budget:budget, spent:spent, leftover: leftover, name:name, cost:cost)
                modelContext.insert(newBudget)
                dismiss()
            }
            .frame(width:125, height: 40, alignment: .center)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .fontWeight(.medium)
        }
    }
}
