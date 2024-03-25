//
//  Packing.swift
//  Trip Planner
//
//  Created by Julia Woeste on 2/14/24.
//

import SwiftUI
import SwiftData

//struct CheckItem {
//    var isChecked: Bool
//}

struct Packing: View {
    @State var showSheet: Bool = false
    @Environment(\.modelContext) var context
    @Query private var packing: [NewPackingData]
    @State var selectedCategory: String?
    
    var body: some View {
        ScrollView {
            ZStack {
                List {
                    Section("Clothes") {
                        ForEach(filteredItems(for: "Clothes")) { p in
                            HStack {
                                Text("\(p.itemName) \nTotal number: \(p.numofItems)")
                                    .fontWeight(.medium)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    Section("Toiletries") {
                        ForEach(filteredItems(for: "Toiletries")) { p in
                            HStack {
                                Text("\(p.itemName) \nTotal number: \(p.numofItems)")
                                    .fontWeight(.medium)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    Section("Shoes") {
                        ForEach(filteredItems(for: "Shoes")) { p in
                            HStack {
                                Text("\(p.itemName) \nTotal number: \(p.numofItems)")
                                    .fontWeight(.medium)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    Section("Hair") {
                        ForEach(filteredItems(for: "Hair")) { p in
                            HStack {
                                Text("\(p.itemName) \nTotal number: \(p.numofItems)")
                                    .fontWeight(.medium)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    Section("Makeup") {
                        ForEach(filteredItems(for: "Makeup")) { p in
                            HStack {
                                Text("\(p.itemName) \nTotal number: \(p.numofItems)")
                                    .fontWeight(.medium)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    Section("First Aid") {
                        ForEach(filteredItems(for: "First Aid")) { p in
                            HStack {
                                Text("\(p.itemName) \nTotal number: \(p.numofItems)")
                                    .fontWeight(.medium)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    Section("Electronics") {
                        ForEach(filteredItems(for: "Electronics")) { p in
                            HStack {
                                Text("\(p.itemName) \nTotal number: \(p.numofItems)")
                                    .fontWeight(.medium)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    Section("Documents") {
                        ForEach(filteredItems(for: "Documents")) { p in
                            HStack {
                                Text("\(p.itemName) \nTotal number: \(p.numofItems)")
                                    .fontWeight(.medium)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    Section("Other") {
                        ForEach(filteredItems(for: "Other")) { p in
                            HStack {
                                Text("\(p.itemName) \nTotal number: \(p.numofItems)")
                                    .fontWeight(.medium)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .frame(height: 60)
                }
                Button {
                    self.showSheet = true
                } label: {
                    Text("Add an Event")
                        .fontWeight(.medium)
                }
                .padding(.bottom, 630)
                .foregroundColor(.blue)
                .cornerRadius(8)
                .sheet(isPresented: $showSheet) {
                    NewPacking()
                }
            }
        }
    }
    
    func filteredItems(for category: String) -> [NewPackingData] {
        return packing.filter { $0.selected == category }
    }
    
    func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            context.delete(packing[index])
        }
    }
}



struct NewPacking: View{
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @State var itemName: String = ""
    @State var numofItems: Int = 0
    @State var selected: String = ""
    @State var options: [String] = ["Clothes", "Toiletries", "Shoes", "Hair", "Makeup", "First Aid", "Electronics", "Documents", "Other"]
    var body: some View{
        VStack{
            Form{
                Section{
                    TextField("Item Name", text: $itemName)
                }
                Section{
                    Picker("Number of items", selection: $numofItems, content: {
                        ForEach(0..<101){number in
                            Text("\(number)")
                                .tag("\(number)")
                        }
                    })
                    
                }
                //drop down menu
                Section{
                    Picker("Options", selection: $selected, content: {
                        ForEach(options, id: \.self){ option in
                            Text(option)
                                .tag("\(option)")
                        }
                    })
                }
            }
            .fontWeight(.medium)
            
            Button("Save"){
                let newPacking = NewPackingData(itemName:itemName, numofItems:numofItems, selected:selected)
                modelContext.insert(newPacking)
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
