//
//  Itinerary.swift
//  Trip Planner
//
//  Created by Julia Woeste on 2/14/24.
//

import SwiftUI
import SwiftData

struct Itinerary: View {
    @State var showSheet: Bool = false
    //@Query private var intinerary = [ItineraryData]

    var body: some View {
        Button{
            self.showSheet = true
        } label: {
            Text("Add an Event")
        }
        .padding(.bottom, 570)
       
        .sheet(isPresented: $showSheet, content: {
            //new trip screen
            NewItinerary()
        })
        

        //Text("hello")
            
        
        
//        NavigationView{
//
//        }.navigationTitle("Itinerary2")
//            .toolbar{
//                Button{
//                    self.showSheet = true
//                } label: {
//                    Text("New")
//                }
//            }
//        ZStack{
//            Button(action: {showSheet.toggle()}) {
//                Text("Button")
//            }
//            .sheet(isPresented: $showSheet, content:{ Text("hello!!!")
//            })
//            .padding(.top, 100)
//        }
    }
}

struct NewItinerary: View{
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @State var startDate: Date = Date()
    @State var eventName: String = ""
    @State var startTime: Date = Date()
    @State var endTime: Date = Date()
    @State var notes: String = ""
    var body: some View{
        VStack{
            Form{
                Section{
                    DatePicker("Start Date", selection: $startDate, displayedComponents: [.date])
                }
                Section{
                    TextField("Event Name", text:$eventName)
                }
                Section{
                    DatePicker("Start Time", selection: $startTime, displayedComponents: [.hourAndMinute])
                }
                Section{
                    DatePicker("End Time", selection: $endTime, displayedComponents: [.hourAndMinute])
                }
                Section{
                    TextField("Notes", text: $notes)
                }
            }
            
            Button("Save"){
                
            }
            .frame(width:125, height: 40, alignment: .center)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}

