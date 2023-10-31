//
//  ItinerarySearch.swift
//  Revolatus
//
//  Created by Rain Poon on 9/10/2023.
//

import SwiftUI

struct ItinerarySearch: View {
    @State private var departingFromIndex = 0
    @State private var goingToIndex = 0
    @State private var departingOn = Date()
    @State private var returningOn = Date()
    @State private var ppl = 0
    let places = ["Hong Kong", "New York", "London", "Paris", "Tokyo", "Sydney"]
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter
    }()
    var body: some View {
        NavigationView {
            ZStack {
                Image("bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    ZStack {
                        Rectangle()
                            .fill(.white)
                            .edgesIgnoringSafeArea(.all)
                            .frame(height: 50)
                            .shadow(radius: 2)
                        HStack {
                            Image(systemName: "airplane.departure")
                            Text("Itinerary")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        
                    }
                    Spacer()
                }
                VStack {
                    Text("Today is ")
                        .foregroundColor(Color.white)
                        .frame(maxWidth: UIScreen.main.bounds.size.width*0.85, alignment: .leading)
                    Text("\(Date(), formatter: dateFormatter)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .frame(maxWidth: UIScreen.main.bounds.size.width*0.85, alignment: .leading)
                        .padding(.bottom, 50.0)
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(20)
                        VStack {
                            Grid() {
                                HStack {
                                    Text("Departing from")
                                        .padding(.leading, 20.0)
                                    Spacer()
                                    Picker("Select Place", selection: $departingFromIndex) {
                                        ForEach(0..<places.count) { index in
                                            Text(places[index])
                                        }
                                    }
                                    .pickerStyle(MenuPickerStyle())
                                }
                                .frame(width: UIScreen.main.bounds.size.width*0.8)
                                Divider()
                                    .gridCellUnsizedAxes(.horizontal)
                                HStack {
                                    Text("Going to")
                                        .padding(.leading, 20.0)
                                    Spacer()
                                    Picker("Select Place", selection: $goingToIndex) {
                                        ForEach(0..<places.count) { index in
                                            Text(places[index])
                                        }
                                    }
                                    .pickerStyle(MenuPickerStyle())
                                }
                                .frame(width: UIScreen.main.bounds.size.width*0.8)
                                Divider()
                                    .gridCellUnsizedAxes(.horizontal)
                                DatePicker(
                                    "  Departing on",
                                    selection: $departingOn,
                                    displayedComponents: [.date]
                                )
                                .frame(width: UIScreen.main.bounds.size.width*0.75)
                                Divider()
                                    .gridCellUnsizedAxes(.horizontal)
                                DatePicker(
                                    "  Returning on",
                                    selection: $returningOn,
                                    displayedComponents: [.date]
                                )
                                .frame(width: UIScreen.main.bounds.size.width*0.75)
                                Divider()
                                    .gridCellUnsizedAxes(.horizontal)
                                HStack {
                                    
                                    Text("Number of Guests")
                                        .padding(.leading, 20.0)
                                    Spacer()
                                    HStack {
                                        Button(action: {
                                            ppl+=1
                                        }) {
                                            Image(systemName: "plus")
                                        }
                                        .padding(5.0)
                                        Text(
                                            String(ppl)
                                        )
                                        Button(action: {
                                            ppl-=1
                                        }) {
                                            Image(systemName: "minus")
                                        }.padding(5.0)
                                    }
                                    .frame(width: 120)
                                    
                                }
                                
                            }
                            
                        }
                        .padding()
                    }
                    
                    .frame(width: UIScreen.main.bounds.size.width*0.9, height: 300)
                    
                    NavigationLink(destination: SearchResultView(), label: {
                        ZStack {
                            Rectangle()
                                .fill(.white)
                                .frame(width: UIScreen.main.bounds.size.width*0.9, height: 50)
                                .cornerRadius(20)
                            Text("Search")
                        }
                        
                    })
                    .padding()
                }
                
            }
        }
        
        
        
    }
}

struct ItinerarySearch_Previews: PreviewProvider {
    static var previews: some View {
        ItinerarySearch()
    }
}
