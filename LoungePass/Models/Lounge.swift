//
//  Lounge.swift
//  LoungePass
//
//  Created by Rain Poon on 18/11/2023.
//

import MapKit

struct Lounge: Identifiable {
    var displayName: String
    var openingHours: String
    var locationDescription: String
    var numRaiting: CGFloat
    var availableFacilities: [Facility]
    var displayDescription: String
    var loungeLocation :CLLocationCoordinate2D
    var id = UUID()
}
