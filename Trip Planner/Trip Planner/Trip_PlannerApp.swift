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
        .modelContainer(for: TripData.self)
        //.modelContainer(for: ItineraryData.self)
    }
}
