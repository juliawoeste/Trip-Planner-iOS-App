//
//  NewPackingData.swift
//  Trip Planner
//
//  Created by Julia Woeste on 3/23/24.
//

import Foundation
import SwiftData

@Model
final class NewPackingData{
    var itemName: String
    var numofItems: Int
    var selected: String
    
    init(itemName: String, numofItems: Int, selected: String){
        self.itemName = itemName
        self.numofItems = numofItems
        self.selected = selected
    }
}
