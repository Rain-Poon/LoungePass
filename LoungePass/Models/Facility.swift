//
//  Facility.swift
//  LoungePass
//
//  Created by Rain Poon on 18/11/2023.
//

import Foundation

struct timeSlot: Identifiable {
    var startTime: String
    var endTime: String
    var numRemainingSlots: Int
    var id = UUID()
}

struct Facility: Identifiable {
    var displayName: String
    var description: String
    var availableTimeSlots: [timeSlot] 
    var id = UUID()
}
