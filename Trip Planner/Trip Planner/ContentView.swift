//
//  ContentView.swift
//  Trip Planner
//
//  Created by Julia Woeste on 1/31/24.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    //first screen
    @Environment(\.modelContext) var context
    //let itineraryInfo : ItineraryData
    //show new trip sheet
    @State var showSheet: Bool = false
    //gets the trip data data
    @Query private var trips: [TripData]
    
    var body: some View {
        NavigationView{
            //list of the trips
            List{
                ForEach(trips){
                    trip in
                    Section{
                        HStack {
                            Image(systemName:"airplane.departure")
                            VStack(alignment: .leading, content: {
                                NavigationLink(trip.destination,destination: MainScreen(tripdata:trip))
                                    .font(.headline)
                                
                                Text("\(trip.startDate.formatted(date:.long, time:.omitted)) to \((trip.endDate).formatted(date:.long, time:.omitted))")
                                    .font(.system(size: 15))
                                    .foregroundColor(.accentColor)
                                
                            })
                        }
                        
                    }
                }
                
                //deletes the trip
                .onDelete(perform: {indexSet in
                    indexSet.map{trips[$0]}.forEach {trip in
                        context.delete(trip)
                    }
                })
                //adds padding to the items in the list
                //.padding()
                
            }
         
            .navigationTitle("Trip Planner")
            
            .toolbar{
                Button{
                    self.showSheet = true
                } label: {
                    Text("New Trip")
                }
                
            }
            
            .sheet(isPresented: $showSheet, content: {
                //new trip screen
                NewTrip()
            })
        }
      
    }
    
}


//new trip screen where users input information about the trip
struct NewTrip: View{
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    //@State private var trip = TripData()
    @State var destination: String = ""
    @State var startDate: Date = Date()
    @State var endDate: Date = Date()
    var body: some View{
        Form{
            Section{
                TextField("Destination", text: $destination)
            }
            Section{
                DatePicker("Start Date", selection: $startDate, displayedComponents: [.date])
                
            }
            Section{
                DatePicker("End Date", selection: $endDate, displayedComponents: [.date])
            }
        }
        
        VStack{
            Button("Save"){
                let newTrip = TripData(destination:destination, startDate:startDate, endDate:endDate)
                modelContext.insert(newTrip)
                dismiss()
            }
            .frame(width:125, height: 40, alignment: .center)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        
    }
    
}

