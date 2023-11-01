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
            ZStack() {
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
                VStack() {
                    Text("Your Upcoming Flights")
                        .font(.title3)
                        .underline()
                    NavigationLink(destination:
                                    SelectBookingView()
                                   , label: {
                        ZStack {
                            Image("hkg_airport")
                                .resizable(resizingMode: .stretch)
                                .frame(width: UIScreen.main.bounds.size.width-50, height: 100
                                )
                                .cornerRadius(10)
                                .blur(radius: 2)
                                .overlay(Color(.white)
                                    .opacity(0.6))
                                .opacity(0.5)
                            HStack {
                                Text("03\nJan")
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .bold()
                                Spacer()
                                HStack {
                                    VStack{
                                        Text("HKG")
                                            .font(.title2)
                                            .foregroundColor(.black)
                                            .bold()
                                        Text("Terminal 2")
                                            .foregroundColor(.black)
                                            .fontWeight(.medium)
                                    }
                                    Image(systemName: "airplane.departure")
                                        .foregroundColor(.black)
                                    VStack{
                                        Text("LHR")
                                            .font(.title2)
                                            .foregroundColor(.black)
                                            .bold()
                                        Text("Terminal 5")
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
                    ZStack {
                        Image("lhr_airport")
                            .resizable(resizingMode: .stretch)
                            .frame(width: UIScreen.main.bounds.size.width-50, height: 100
                            )
                            .cornerRadius(10)
                            .blur(radius: 2)
                            .opacity(0.5)
                        HStack {
                            Text("14\nJan")
                                .multilineTextAlignment(.center)
                            Spacer()
                            HStack {
                                Text("LHR")
                                Image(systemName: "arrow.right")
                                Text("HKG")
                            }
                            Spacer()
                        }
                        .frame(width: UIScreen.main.bounds.width-100)
                    }
                    .padding(.vertical)
                    Text("Or")
                        .font(.title3)
                    
                    NavigationLink(destination: SelectBookingView(), label: {
                        ZStack {
                            Rectangle()
                                .fill(.white)
                                .frame(width: UIScreen.main.bounds.size.width*0.8, height: 50)
                                .cornerRadius(20)
                                .shadow(radius: 2)
                            Text("Search by Airport")
                        }
                        
                    })
                    .padding()
                }
            }
        }
        
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
