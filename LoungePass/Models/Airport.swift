//
//  Airport.swift
//  LoungePass
//
//  Created by Rain Poon on 18/11/2023.
//

import Foundation
import MapKit


struct Airport: Identifiable  {
    let id = UUID()
    let airportName: String
    var airportLocation: CLLocationCoordinate2D
    var loungeList: [Lounge]
}
