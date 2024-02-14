//
//  TripData.swift
//  Trip Planner
//
//  Created by Julia Woeste on 2/13/24.
//

import Foundation
import SwiftData

@Model
final class TripData{
    var destination: String
    var startDate: Date
    var endDate: Date
    
    init(destination: String, startDate: Date, endDate:Date){
        self.destination = destination
        self.startDate = startDate
        self.endDate = endDate
    }
}
