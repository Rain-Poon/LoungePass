//
//  HomePageView.swift
//  LoungePass
//
//  Created by Rain Poon on 31/10/2023.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {
                VStack {
                    ZStack {
                        Rectangle()
                            .fill(.white)
                            .edgesIgnoringSafeArea(.all)
                            .frame(height: 50)
                            .shadow(radius: 2)
                        HStack {
                            Image(systemName: "chair.lounge")
                            Text("LoungePass")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        
                    }
                    Spacer()
                }
                VStack {
                    Text("Your Upcoming Flights")
                        .font(.title3)
                        .underline()
                    itineraryViewBlock(
                        destination: AnyView(SelectBookingView()), imageName: "hkg_airport", itineraryDate: "03\nJan", fromAirport: "HKG", fromAirportTerminal: "Terminal 1", toAirport: "LHR", toAirportTerminal: "Terminal 5"
                    )
                    itineraryViewBlock(
                        destination: AnyView(SelectBookingView()), imageName: "lhr_airport", itineraryDate: "14\nJan", fromAirport: "LHR", fromAirportTerminal: "Terminal 5", toAirport: "HKG", toAirportTerminal: "Terminal 1"
                    )
                    Text("Or")
                        .font(.title3)
                    
                    NavigationLink(destination: SearchView2(), label: {
                        ZStack {
                            Text("Search by Airport")
                                .foregroundColor(.black)
                                .bold()
                                .overlay(
                                    RoundedRectangle(cornerRadius:10)
                                        .stroke(Color.black, lineWidth: 1)
                                        .frame(width: UIScreen.main.bounds.size.width*0.8, height: 50)
                                )
                        }
                        
                    })
                    .padding()
                }
            }
        }
        
    }
}

struct itineraryViewBlock: View {
    @State var destination: AnyView
    @State var imageName: String
    @State var itineraryDate: String
    @State var fromAirport: String
    @State var fromAirportTerminal: String
    @State var toAirport: String
    @State var toAirportTerminal: String
    
    var body: some View {
        NavigationLink(destination: destination, label: {
            ZStack {
                Image(imageName)
                    .resizable(resizingMode: .stretch)
                    .frame(width: UIScreen.main.bounds.size.width-50, height: 100
                    )
                    .cornerRadius(10)
                    .blur(radius: 2)
                    .overlay(Color(.white)
                        .opacity(0.6))
                    .opacity(0.5)
                HStack {
                    Text(itineraryDate)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .bold()
                    Spacer()
                    HStack {
                        VStack{
                            Text(fromAirport)
                                .font(.title2)
                                .foregroundColor(.black)
                                .bold()
                            Text(fromAirportTerminal)
                                .foregroundColor(.black)
                                .fontWeight(.medium)
                        }
                        Image(systemName: "airplane.departure")
                            .foregroundColor(.black)
                        VStack{
                            Text(toAirport)
                                .font(.title2)
                                .foregroundColor(.black)
                                .bold()
                            Text(toAirportTerminal)
                                .foregroundColor(.black)
                                .fontWeight(.medium)
                        }
                    }
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width-100)
                
            }
        })
        .padding(.vertical)
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
