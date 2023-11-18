//
//  SearchView2.swift
//  LoungePass
//
//  Created by Rain Poon on 2/11/2023.
//

import SwiftUI
import UIKit
import MapKit

struct nearbyView: View {
    @State public var airportList: [Airport]
//    @State private var selectedAirport: Airport
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "mappin.and.ellipse")
                Text("Nearby")
                    .foregroundColor(Color.black)
            }.padding(.top, 20.0).frame(maxWidth: UIScreen.main.bounds.size.width*0.85, alignment: .leading)
            ScrollView{
                    VStack{
                        Spacer().frame(height:20)
                        //first direction
                        VStack (spacing: 50) {
                            ForEach(airportList){airport in
                                NavigationLink(destination:SelectLoungeView(airport: airport)){
                                ZStack {
                                    Image(String(Int.random(in: 1..<6)))
                                        .resizable(resizingMode: .stretch)
                                        .frame(width: UIScreen.main.bounds.size.width-50, height: 120
                                        )
                                        .cornerRadius(10)
                                        .blur(radius: 2)
                                        .opacity(0.7)
                                    VStack{
                                        HStack{
                                            Image(systemName: "location")
                                                .foregroundColor(Color.black)
                                            Text("31.8m")
                                                .font(.body)
                                                .foregroundColor(Color.black)
                                        }.frame(maxWidth: UIScreen.main.bounds.size.width*0.8, alignment:.topTrailing)
                                        Spacer().frame(height:40)
                                        Text(airport.airportName)
                                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                            .font(.title3)
                                            .fontWeight(.heavy)
                                            .foregroundColor(Color.black).frame(maxWidth: UIScreen.main.bounds.size.width*0.8
                                                                                , alignment: .leading)
                                    }
                                }
                                
                            }
                        }
                    }
                }
            }
        }
    }
}

struct SearchView2: View {
    @State private var searchText = ""
    @State private var isShowNearby = true
    
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
//    let _airports = [
//        Airport(airportName: "John F. Kennedy International Airport", airportLocation: CLLocationCoordinate2D(latitude: 0, longitude: 0), loungeList: []),
//        Airport(airportName: "Los Angeles International Airport", airportLocation: CLLocationCoordinate2D(latitude: 0, longitude: 0), loungeList: []),
//        Airport(airportName: "Heathrow Airport", airportLocation: CLLocationCoordinate2D(latitude: 0, longitude: 0), loungeList: []),
//        Airport(airportName: "Tokyo Haneda Airport", airportLocation: CLLocationCoordinate2D(latitude: 0, longitude: 0), loungeList: []),
//        Airport(airportName: "Hong Kong International Airport", airportLocation: CLLocationCoordinate2D(latitude: 0, longitude: 0), loungeList: [])
//    ]
    let airports = SampleData().getData;
    
    var filteredAirports: [Airport] {
        if searchText.isEmpty {
            return airports
        } else {
            return airports.filter { airport in
                airport.airportName.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search", text: $searchText, onEditingChanged: { focused in
                    isShowNearby = !focused})
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                Button(action: {
                    searchText = ""
                    dismissKeyboard()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .padding([.top, .bottom, .trailing])
                }
            }
            
            VStack {
                
                if isShowNearby {
                    nearbyView(airportList: airports)                      .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                } else {
                    List(filteredAirports) { airport in
                        NavigationLink(destination: SelectLoungeView(airport: airport)){ Text(airport.airportName)}
                    }
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
                
            }
            .animation(.easeInOut, value: isShowNearby)
        }
    }
}

struct SearchView2_Previews: PreviewProvider {
    static var previews: some View {
        SearchView2()
    }
}
