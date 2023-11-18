//
//  Notification.swift
//  LoungePass
//
//  Created by Rain Poon on 18/11/2023.
//

import Foundation

struct Notification: Codable {
    var tryNew = false
    var oneDayPrior = false
    var arriveAirport = false
    var boardingGateConfirmed = false
    var oneHourPriorBoarding = false
    var thirtyMinPriorBoarding = false
    var postFlight = false
}
