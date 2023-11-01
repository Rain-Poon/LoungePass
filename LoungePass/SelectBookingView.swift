//
//  SelectBookingView.swift
//  LoungePass
//
//  Created by Rain Poon on 31/10/2023.
//

import SwiftUI

struct SelectBookingView: View {
    enum AccessType: String, CaseIterable, Identifiable {
        case freeAccess = "Free Access"
        case paidAccess = "Paid Access"
        var id: Self { self }
    }
    
    @State private var selectedAccessType: AccessType = .freeAccess
    
    var body: some View {
        VStack {
            Text("Hong Kong International Airport")
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
            destinationView(accessType: selectedAccessType)   
        }
        .navigationBarTitle("LoungePass", displayMode: .inline)
    }
        
    
    func destinationView(accessType: AccessType) -> AnyView {
        switch accessType {
        case .freeAccess:
            return AnyView(FreeAccessView())
        case .paidAccess:
            return AnyView(ContentView())
        }
    }
}


struct SelectBookingView_Previews: PreviewProvider {
    static var previews: some View {
        SelectBookingView()
    }
}
