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
    @Query private var packing: [PackingData]
    @State var selectedCategory: String?
    
    var body: some View {
        ScrollView {
            ZStack {
                List {
                    Section("Clothes") {
                        ForEach(filteredItems(for: "Clothes").indices, id: \.self) { index in
                            let item = filteredItems(for: "Clothes")[index]
                            HStack {
                                Text("\(item.itemName) \nTotal number: \(item.numofItems)")
                                    .fontWeight(.medium)
                                Spacer()
                                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isCompleted ? .green : .gray)
                                    .onTapGesture {
                                        withAnimation {
                                            item.isCompleted.toggle()
                                        }
                                    }
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    Section("Toiletries") {
                        ForEach(filteredItems(for: "Toiletries").indices, id: \.self) { index in
                            let item = filteredItems(for: "Toiletries")[index]
                            HStack {
                                Text("\(item.itemName) \nTotal number: \(item.numofItems)")
                                    .fontWeight(.medium)
                                Spacer()
                                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isCompleted ? .green : .gray)
                                    .onTapGesture {
                                        withAnimation {
                                            item.isCompleted.toggle()
                                        }
                                    }
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    Section("Shoes") {
                        ForEach(filteredItems(for: "Shoes").indices, id: \.self) { index in
                            let item = filteredItems(for: "Shoes")[index]
                            HStack {
                                Text("\(item.itemName) \nTotal number: \(item.numofItems)")
                                    .fontWeight(.medium)
                                Spacer()
                                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isCompleted ? .green : .gray)
                                    .onTapGesture {
                                        withAnimation {
                                            item.isCompleted.toggle()
                                        }
                                    }
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    Section("Hair") {
                        ForEach(filteredItems(for: "Hair").indices, id: \.self) { index in
                            let item = filteredItems(for: "Hair")[index]
                            HStack {
                                Text("\(item.itemName) \nTotal number: \(item.numofItems)")
                                    .fontWeight(.medium)
                                Spacer()
                                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isCompleted ? .green : .gray)
                                    .onTapGesture {
                                        withAnimation {
                                            item.isCompleted.toggle()
                                        }
                                    }
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    Section("Makeup") {
                        ForEach(filteredItems(for: "Makeup").indices, id: \.self) { index in
                            let item = filteredItems(for: "Makeup")[index]
                            HStack {
                                Text("\(item.itemName) \nTotal number: \(item.numofItems)")
                                    .fontWeight(.medium)
                                Spacer()
                                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isCompleted ? .green : .gray)
                                    .onTapGesture {
                                        withAnimation {
                                            item.isCompleted.toggle()
                                        }
                                    }
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    Section("First Aid") {
                        ForEach(filteredItems(for: "First Aid").indices, id: \.self) { index in
                            let item = filteredItems(for: "First Aid")[index]
                            HStack {
                                Text("\(item.itemName) \nTotal number: \(item.numofItems)")
                                    .fontWeight(.medium)
                                Spacer()
                                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isCompleted ? .green : .gray)
                                    .onTapGesture {
                                        withAnimation {
                                            item.isCompleted.toggle()
                                        }
                                    }
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    Section("Electronics") {
                        ForEach(filteredItems(for: "Electronics").indices, id: \.self) { index in
                            let item = filteredItems(for: "Electronics")[index]
                            HStack {
                                Text("\(item.itemName) \nTotal number: \(item.numofItems)")
                                    .fontWeight(.medium)
                                Spacer()
                                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isCompleted ? .green : .gray)
                                    .onTapGesture {
                                        withAnimation {
                                            item.isCompleted.toggle()
                                        }
                                    }
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    Section("Documents") {
                        ForEach(filteredItems(for: "Documents").indices, id: \.self) { index in
                            let item = filteredItems(for: "Documents")[index]
                            HStack {
                                Text("\(item.itemName) \nTotal number: \(item.numofItems)")
                                    .fontWeight(.medium)
                                Spacer()
                                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isCompleted ? .green : .gray)
                                    .onTapGesture {
                                        withAnimation {
                                            item.isCompleted.toggle()
                                        }
                                    }
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    Section("Other") {
                        ForEach(filteredItems(for: "Other").indices, id: \.self) { index in
                            let item = filteredItems(for: "Other")[index]
                            HStack {
                                Text("\(item.itemName) \nTotal number: \(item.numofItems)")
                                    .fontWeight(.medium)
                                Spacer()
                                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isCompleted ? .green : .gray)
                                    .onTapGesture {
                                        withAnimation {
                                            item.isCompleted.toggle()
                                        }
                                    }
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .frame(height: 60)
                }
                Button {
                    self.showSheet = true
                } label: {
                    Text("Add an Item")
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
    
    func filteredItems(for category: String) -> [PackingData] {
        return packing.filter { $0.selected == category }
    }
    
    func deleteItems(at offsets: IndexSet) {
        for offset in offsets {
            let items = packing.filter { item in
                return filteredItems(for: item.selected).contains(item)
            }
            if offset < items.count {
                let item = items[offset]
                if let index = packing.firstIndex(where: { $0.id == item.id }) {
                    context.delete(packing[index])
                }
            }
        }
    }
}



struct NewPacking: View{
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @State var itemName: String = ""
    @State var numofItems: Int = 0
    @State var selected: String = ""
    @State var isCompleted: Bool = false
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
                let newPacking = PackingData(itemName:itemName, numofItems:numofItems, selected:selected, isCompleted:isCompleted)
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
