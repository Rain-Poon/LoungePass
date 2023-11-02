//
//  SearchView2.swift
//  LoungePass
//
//  Created by Rain Poon on 2/11/2023.
//

import SwiftUI
import UIKit

struct Airport: Identifiable {
    let id = UUID()
    let name: String
}

struct SearchView2: View {
    @State private var searchText = ""
    @State private var isShowNearby = true
    
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    let airports = [
        Airport(name: "John F. Kennedy International Airport"),
        Airport(name: "Los Angeles International Airport"),
        Airport(name: "Heathrow Airport"),
        Airport(name: "Tokyo Haneda Airport"),
        Airport(name: "Hong Kong International Airport")
    ]
    
    var filteredAirports: [Airport] {
        if searchText.isEmpty {
            return airports
        } else {
            return airports.filter { airport in
                airport.name.localizedCaseInsensitiveContains(searchText)
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
                    nearbyView
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                } else {
                    List(filteredAirports) { airport in
                        NavigationLink(destination: SelectBookingView()){ Text(airport.name)}
                    }
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
                
            }
            .animation(.easeInOut, value: isShowNearby)
        }
    }
}

var nearbyView: some View {
    VStack {
        HStack{
            Image(systemName: "mappin.and.ellipse")
            Text("Nearby")
                .foregroundColor(Color.black)
        }.padding(.top, 20.0).frame(maxWidth: UIScreen.main.bounds.size.width*0.85, alignment: .leading)
        ScrollView{
            NavigationLink(destination:SelectBookingView()){
                VStack{
                    Spacer().frame(height:20)
                    //first direction
                    ZStack{
                        Image("hkg_airport")
                            .resizable(resizingMode: .stretch)
                            .frame(width: UIScreen.main.bounds.size.width-50, height: 100
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
                            Spacer().frame(height:30)
                            Text("Hong Kong International Airport")
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

struct SearchView2_Previews: PreviewProvider {
    static var previews: some View {
        SearchView2()
    }
}
