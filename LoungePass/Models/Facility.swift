//
//  Facility.swift
//  LoungePass
//
//  Created by Rain Poon on 18/11/2023.
//

import Foundation

struct timeSlot {
    var startTime: String
    var endTime: String
    var numRemainingSlots: Int
}

struct Facility {
    var displayName: String
    var description: String
    var availableTimeSlots: [timeSlot]
}
