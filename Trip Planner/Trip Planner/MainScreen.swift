//
//  MainScreen.swift
//  Trip Planner
//
//  Created by Julia Woeste on 2/13/24.
//

import SwiftUI
import SwiftData

enum Tabs: String{
    case itinerary
    case packing
    case budget
}

struct MainScreen: View {
    @Query private var trips: [TripData]
    let tripdata: TripData
    @State var showSheet: Bool = false
    @State var selectedTab: Tabs = .itinerary
    
    var body: some View {
        VStack{
            TabView(selection: $selectedTab){
                Itinerary()
                    .tabItem { Label("Itinerary", systemImage: "list.clipboard") }
                    .tag(Tabs.itinerary)
                Packing()
                    .tabItem { Label("Packing List", systemImage:"tshirt") }
                    .tag(Tabs.packing)
                Budget()
                    .tabItem { Label("Budget", systemImage: "dollarsign.circle") }
                    .tag(Tabs.budget)
            }.navigationTitle(selectedTab.rawValue.capitalized)
            Text("Trip Name: \(tripdata.destination)")
            //.font(.)
                .fontWeight(.bold)
                //.padding(.bottom, 100)
        }

//            .toolbar{
//            Button{
//                self.showSheet = true
//            } label: {
//                Text("add")
//            }
//        }
//        .sheet(isPresented: $showSheet, content: {
//            //new trip screen
//            Itinerary()
//        })
        //        VStack{
        //
        //                TabView{
        //                        NavigationLink(destination: Itinerary()) {
        //
        //                        }.navigationBarTitle("Itinerary for \(tripdata.destination)")
        //                            .padding(.bottom, 200)
        //                            .navigationBarTitleDisplayMode(.inline)
        //                            .toolbar{
        //                                Button{
        //                                    self.showSheet = true
        //                                } label: {
        //                                    Text("Add")
        //                                }
        //                            }
        //                            .sheet(isPresented: $showSheet, content: {
        //                                //new trip screen
        //                                NewItinerary()
        //                            })
        //                    .tabItem { Label("Itinerary", systemImage: "list.clipboard") }
        //
        //                        NavigationLink(destination: Packing()) {
        //                        }.navigationBarTitle("Packing List")
        //                    .tabItem { Label("Packing List", systemImage:"tshirt") }
        //
        //                    NavigationView{
        //                        NavigationLink(destination: Budget()) {
        //                        }.navigationTitle("Budget")
        //                    }.tabItem { Label("Budget", systemImage: "dollarsign.circle") }
        //
        //
        //                }
        //
                        
        //            }
        //}
    }
}




