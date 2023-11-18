//
//  SelectBookingView.swift
//  LoungePass
//
//  Created by Rain Poon on 31/10/2023.
//

import SwiftUI

struct SelectLoungeView: View {
    enum AccessType: String, CaseIterable, Identifiable {
        case freeAccess = "Free Access"
        case paidAccess = "Paid Access"
        var id: Self { self }
    }
    @State public var airport: Airport
    @State private var selectedAccessType: AccessType = .freeAccess
    
    var body: some View {
        VStack {
            Text(airport.airportName)
                .bold()
            Text("Terminal 2 (Departure)")
                .fontWeight(.thin)
            Picker("AccessType", selection: $selectedAccessType) {
                ForEach(AccessType.allCases) { accessType in
                    Text(accessType.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            destinationView(accessType: selectedAccessType, loungeList: airport.loungeList)
        }
        .navigationBarTitle("LoungePass", displayMode: .inline)
    }
        
    
    func destinationView(accessType: AccessType, loungeList: [Lounge]) -> AnyView {
        switch accessType {
        case .freeAccess:
            return AnyView(DisplayLoungeView(loungeList: loungeList))
        case .paidAccess:
            return AnyView(ContentView())
        }
    }
}


struct SelectLoungeView_Previews: PreviewProvider {
    static var previews: some View {
        SelectLoungeView(airport: SampleData().getData[0])
    }
}
