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
    @State var showSheet: Bool = false
    @Query private var budgeting: [BudgetData]
    //@State private var b: Int
    //@State var numofItems: Int = 0
    var totalBudget: Int {
        budgeting.reduce(0) { $0 + $1.budget }
    }
    var totalSpent: Int {
        budgeting.reduce(0) { $0 + $1.cost }
    }
    var budgetLeft: Int{
        totalBudget - totalSpent
    }
    
    var body: some View {
        VStack {
            Button(action: {
                self.showSheet = true
            }) {
                Text("New Spending")
                    .fontWeight(.medium)
            }
            .padding()
            .foregroundColor(.blue)
            .cornerRadius(8)
            .sheet(isPresented: $showSheet) {
                NewSpending()
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
                Section{
                    TextField("Item Name", text: $name)
                }
                Section("Cost"){
                    TextField("$", value: $cost, format: .number)
                }
                Section("Budget"){
                    TextField("$", value: $budget, format: .number)
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
}


