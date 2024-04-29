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
    let tripdata: TripData
    @State var showSheet: Bool = false
    @State var selectedTab: Tabs = .itinerary
    
    var body: some View {
        VStack{
            //created the tab view at the bottom on page, allows users to switch between 3 screens
            TabView(selection: $selectedTab){
                Itinerary(tripdata: tripdata)
                    .tabItem { Label("Itinerary", systemImage: "list.clipboard") }
                    .tag(Tabs.itinerary)
                Packing(tripdata: tripdata)
                    .tabItem { Label("Packing List", systemImage:"tshirt") }
                    .tag(Tabs.packing)
                Budget()
                    .tabItem { Label("Budget", systemImage: "dollarsign.circle") }
                    .tag(Tabs.budget)
            }.navigationTitle(selectedTab.rawValue.capitalized)
        }
    }
}




