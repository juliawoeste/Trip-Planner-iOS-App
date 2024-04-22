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
    @Environment(\.modelContext) var context
    let tripdata: TripData
    @Query private var itinerary: [ItineraryData]
    
    var body: some View {
        ScrollView{
            ZStack{
                List{
                    ForEach(itinerary){
                        i in
                        Section{
                    
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.black, lineWidth: 1)
                                        //.fill(Color.accentColor)
                                    HStack {
                                        Image(systemName:"ticket")
                                        VStack(alignment: .leading, content: {
                                            
                                            
                                            Text("Event: \(i.eventName) \nDate: \((i.startDate).formatted(date:.long, time:.omitted)) \nTime: \((i.startTime).formatted(date:.omitted, time:.shortened)) - \((i.endTime).formatted(date:.omitted, time:.shortened))")
                                                .font(.system(size: 15))
                                                .fontWeight(.light)
                                        })
                                        .listRowBackground(Color.white)
                                    }
                                }
                            
                        }
                    }
                    
                    .onDelete(perform: {indexSet in
                        indexSet.map{itinerary[$0]}.forEach {i in
                            context.delete(i)
                        }
                    })
                    .frame(height: 60)
                }
                .listStyle(PlainListStyle())
                .padding(.top, 40)
                Spacer()
                Text("Trip to \(tripdata.destination)")
                    .padding(.bottom, 710)
                    .padding(.leading, 0)
                    .fontWeight(.medium)
                Spacer()
                Button{
                    self.showSheet = true
                } label: {
                    //Image(systemName:"plus")
                    Text("Add an Event")
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding(3)
                        .background(Color.accentColor)
                        .cornerRadius(8)
                }
                .padding(.bottom, 660)
                //.padding(.leading, 120)
                
                .foregroundColor(.blue)
                .cornerRadius(8)
                
                .sheet(isPresented: $showSheet, content: {
                    //new trip screen
                    NewItinerary()
                })
                
                
            }
            
            .background(Color.white)
        }
    }
}


struct NewItinerary: View{
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @State var startDate: Date = Date()
    @State var eventName: String = ""
    @State var startTime: Date = Date()
    @State var endTime: Date = Date()
    var body: some View{
        VStack{
            Form{
                Section{
                    DatePicker("Start Date", selection: $startDate, displayedComponents: [.date])
                        .fontWeight(.medium)
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
            }
            .fontWeight(.medium)
            
            Button("Save"){
                let newItinerary = ItineraryData(startDate: startDate, eventName: eventName, startTime: startTime, endTime: endTime)
                modelContext.insert(newItinerary)
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

