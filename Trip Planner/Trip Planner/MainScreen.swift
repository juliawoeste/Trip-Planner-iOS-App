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
    //@Binding var item: CheckItem
    //let itineraryInfo : ItineraryData
    @State var showSheet: Bool = false
    @State var selectedTab: Tabs = .itinerary
    
    var body: some View {
        VStack{
            TabView(selection: $selectedTab){
                Itinerary(tripdata: tripdata)
                    .tabItem { Label("Itinerary", systemImage: "list.clipboard") }
                    .tag(Tabs.itinerary)
                Packing()
                    .tabItem { Label("Packing List", systemImage:"tshirt") }
                    .tag(Tabs.packing)
                Budget()
                    .tabItem { Label("Budget", systemImage: "dollarsign.circle") }
                    .tag(Tabs.budget)
            }.navigationTitle(selectedTab.rawValue.capitalized)
            //Text("Trip Name: \(tripdata.destination)")
            //.font(.)
                .fontWeight(.bold)
            //.padding(.bottom, 100)
        }
    }
}




