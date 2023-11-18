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
                            .fill(Color(red: 0x00/0xff, green: 0x64/0xff, blue: 0x5a/0xff))
                            .edgesIgnoringSafeArea(.all)
                            .frame(height: 50)
                            .shadow(radius: 2)
                        HStack {
                            Image(systemName: "chair.lounge")
                                .foregroundColor(.white)
                            Text("LoungePass")
                                .foregroundColor(.white)
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        
                    }
                    Spacer()
                }
                .background(Color(hue: 1.0, saturation: 0.016, brightness: 0.961, opacity: 0.5))
                VStack {
                    Text("Your Upcoming Flights")
                        .font(.title2)
                        .fontWeight(.bold)
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
                                .background(
                                    RoundedRectangle(cornerRadius:10)
                                        .stroke(Color.black, lineWidth: 1)
                                        .background(.white)
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
                    .blur(radius: 0.8)
                    .overlay(Color(.white)
                        .opacity(0.2))
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
