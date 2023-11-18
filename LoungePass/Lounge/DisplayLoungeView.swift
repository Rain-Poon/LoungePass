//
//  FreeAccessView.swift
//  LoungePass
//
//  Created by Rain Poon on 31/10/2023.
//

import SwiftUI

struct DisplayLoungeView: View {
    @State public var loungeList: [Lounge]
    var body: some View {
        // Navigation View is not defined here. Go to the main app to access the sub pages
//        NavigationView {
            ScrollView {
                ForEach(0..<loungeList.count, id: \.self){index in
                    FreeAccessViewBlock(destination: AnyView(LoungeDetailView(address: loungeList[index].locationDescription, lounge: loungeList[index])), imageName: "cathay_lounge", maxCapcity: 250, currentOccupation: 83, displayName: loungeList[index].displayName, distance: loungeList[index].locationDescription)
                }
                
//                FreeAccessViewBlock(destination: AnyView(LoungeDetailView(address: "Gate W65, Hong Kong International Airport, Terminal 1, 6 Sky Plaza Rd, Lantau Island")), imageName: "cathay_lounge", maxCapcity: 250, currentOccupation: 82, displayName: "Cathay Lounge", distance: "0.5 km away");
//                FreeAccessViewBlock(destination: AnyView(LoungeDetailView(address: "Gate W65, Hong Kong International Airport, Terminal 1, 6 Sky Plaza Rd, Lantau Island")), imageName: "plaza_premium_lounge",maxCapcity: 250,currentOccupation: 163, displayName: "Plaza Premium Lounge", distance: "0.8 km away");
        }
        
    }
}

struct FreeAccessViewBlock: View {
    var destination: AnyView
    var imageName: String
    var maxCapcity: Double
    var currentOccupation: Double
    var displayName: String
    var distance: String
    
    
    @State private var occupationDisplayColor: Color
        
    init(
        destination: AnyView,
        imageName: String,
        maxCapcity: Double,
        currentOccupation: Double,
        displayName: String,
        distance: String
    ){
        if (currentOccupation / maxCapcity < 0.5){
            occupationDisplayColor = Color.white
        } else if (currentOccupation / maxCapcity < 0.8){
            occupationDisplayColor = Color.yellow
        } else {
            occupationDisplayColor = Color.red
        }
        self.destination = destination
        self.imageName = imageName
        self.maxCapcity = maxCapcity
        self.currentOccupation = currentOccupation
        self.displayName = displayName
        self.distance = distance
    }
    
    var body: some View {
        NavigationLink(destination: destination) {
            ZStack {
                Image(imageName)
                    .resizable(resizingMode: .stretch)
                    .frame(width: UIScreen.main.bounds.size.width-50, height: 170)
                    .cornerRadius(10)
                    .blur(radius: 1.2)
                    .opacity(0.7)
                    .overlay(
                        Gradient(colors: [.clear, .white])
                            .opacity(0.5)
                    )
                VStack(alignment: .trailing) {
                    HStack(content: {
                            Image(systemName: "person.fill")
                                .foregroundColor(.black)
                            Text("\(currentOccupation, specifier: "%.0f")/\(maxCapcity, specifier: "%.0f")")
                                .bold()
                                .foregroundColor(.black)
                                .fontWeight(.medium)
                    })
                    .frame(alignment: .trailing)
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(occupationDisplayColor)
                        )
                    
                    Spacer()
                    Text(displayName)
                        .foregroundColor(.black)
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack(alignment: .top, content: {
                        Text(distance)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                                   alignment: .leading
                            )
                            .foregroundColor(.black)
                            .bold()
                    })
                    
                }
                .frame(width: UIScreen.main.bounds.width-100, height: 130)
                
            }
            .padding(.vertical)
        }
    }
}

struct DisplayLoungeView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayLoungeView(loungeList: SampleData().getData[0].loungeList)
    }
}
