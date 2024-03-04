
//  ItineraryData.swift
//  Trip Planner
//
//  Created by Julia Woeste on 2/28/24.


import Foundation
import SwiftData

@Model
final class ItineraryData{
    var startDate: Date
    var eventName: String
    var startTime: Date
    var endTime: Date
    var notes: String
    
    init(startDate: Date, eventName: String, startTime: Date, endTime: Date, notes: String){
        self.startDate = startDate
        self.eventName = eventName
        self.startTime = startTime
        self.endTime = endTime
        self.notes = notes
    }
}
