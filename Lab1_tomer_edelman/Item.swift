//
//  Item.swift
//  Lab1_tomer_edelman
//
//  Created by user271259 on 2/10/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
