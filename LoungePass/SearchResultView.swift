//
//  SearchResultView.swift
//  Revolatus
//
//  Created by Rain Poon on 15/10/2023.
//

import SwiftUI

struct SearchResultView: View {
    let plan_options = ["Greenest", "Cheapest", "Best Budget", "High Quality"]
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                Text("Hong Kong")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("to")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Sydney")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Plans to choose")
                    .font(.headline)
                    .foregroundColor(Color.white.opacity(0.5))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 20) {
                        ForEach(0..<plan_options.count) { index in
                            Text("\(plan_options[index])")
                                .font(.caption)
                                .padding(8)
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .frame(height: 50) // Adjust the height as desired
                        }
                    }
                }
                .frame(height: 50)
                .padding(.bottom)
                ScrollView {
                    LazyVStack {
                        ZStack {
                            Rectangle()
                                .fill(Color.purple.opacity(0.7))
                                .frame(width: UIScreen.main.bounds.size.width*0.9, height: 200)
                                .cornerRadius(15)
                            VStack {
                                HStack {
                                    Text("Flight to Sydney")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding([.leading, .bottom, .trailing])
                                    Image(systemName: "airplane.departure")
                                        .resizable(resizingMode: .stretch)
                                        .foregroundColor(Color.white)
                                        .padding()
                                        .frame(width: 120, height: 100)
                                }
                                
                                HStack {
                                    Text("Boarding Time:")
                                        .foregroundColor(Color.black.opacity(0.5))
                                        .padding(.leading)
                                    Spacer()
                                    Text("00:15 AM (UTC+ 8)")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .padding(.trailing)
                                }
                                HStack {
                                    Text("Arrival Time:")
                                        .foregroundColor(Color.black.opacity(0.5))
                                        .padding(.leading)
                                    Spacer()
                                    Text("13:15 PM (UTC+11)")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .padding(.trailing)
                                }
                                
                            }
                            
                        }
                        .frame(width: UIScreen.main.bounds.size.width*0.9, height: 200)
                        Text("Trip Highlights")
                            .font(.title3)
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical)
                        Image("OperaHouse")
                            .resizable(resizingMode: .stretch)
                            .cornerRadius(15)
                            .frame(width: UIScreen.main.bounds.size.width*0.9, height: 250)
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.size.width*0.9)
        }
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView()
    }
}
