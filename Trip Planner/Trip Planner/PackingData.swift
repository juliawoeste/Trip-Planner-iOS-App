//
//  PackingData.swift
//  Trip Planner
//
//  Created by Julia Woeste on 3/26/24.
//

import Foundation
import SwiftData

@Model
final class PackingData{
    var itemName: String
    var numofItems: Int
    var selected: String
    var isCompleted: Bool
    
    init(itemName:String, numofItems: Int, selected: String, isCompleted: Bool = false){
        self.itemName = itemName
        self.numofItems = numofItems
        self.selected = selected
        self.isCompleted = isCompleted
    }
}
