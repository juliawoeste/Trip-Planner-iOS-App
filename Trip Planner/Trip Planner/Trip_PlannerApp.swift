//
//  Trip_PlannerApp.swift
//  Trip Planner
//
//  Created by Julia Woeste on 1/31/24.
//

import SwiftUI
import SwiftData

@main
struct Trip_PlannerApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        //this is for all of the data files for each screen
        .modelContainer(for: [TripData.self, ItineraryData.self, PackingData.self, BudgetData.self])
    }
}
