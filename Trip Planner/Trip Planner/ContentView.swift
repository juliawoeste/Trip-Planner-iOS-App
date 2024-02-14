//
//  ContentView.swift
//  Trip Planner
//
//  Created by Julia Woeste on 1/31/24.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    @Environment(\.modelContext) var context
    @State var showSheet: Bool = false
    @Query private var trips: [TripData]
    
    var body: some View {
        NavigationView{
            List{
                ForEach(trips){
                    trip in
                    
                    HStack {
                        Image(systemName:"airplane.departure")
                        VStack(alignment: .leading, content: {
                            NavigationLink(trip.destination,destination: MainScreen())
                                .font(.headline)
                            
                            Text("\(trip.startDate.formatted(date:.long, time:.shortened)) to \((trip.endDate).formatted(date:.long, time:.shortened))")
                                .font(.system(size: 15))
                                
                        })
                    }
                }
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
                    DatePicker("Start Date", selection: $startDate)
                }
                Section{
                    DatePicker("End Date", selection: $endDate)
                }
            }
            VStack{
                Button("Save"){
                    let newTrip = TripData(destination:destination, startDate:startDate, endDate:endDate)
                    modelContext.insert(newTrip)
                    dismiss()
                }
                    .frame(width:100, height: 30, alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
          
        }
    }
    
#Preview {
    ContentView()
}
