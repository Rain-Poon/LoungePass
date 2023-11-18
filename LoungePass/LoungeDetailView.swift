//
//  LoungeDetailView.swift
//  LoungePass
//
//  Created by Rain Poon on 31/10/2023.
//

import SwiftUI
import UIKit
import MapKit

let featuredPhotos = ["cathay_lounge_1", "cathay_lounge_2", "cathay_lounge_3"]

// for facilities
let columns = [
    GridItem(.flexible(), alignment: .leading),
    GridItem(.flexible(), alignment: .leading)
]
//let grids = [
//    ("person.fill", "250 Seats"),
//    ("chair.lounge.fill", "20 Sleeping Chairs"),
//    ("studentdesk", "20 Working Desks"),
//    ("shower.fill", "5 Showers"),
//    ("powerplug.fill", "10 Charging Ports"),
//    ("table.furniture.fill", "40 Dining Tables")
//]

struct LoungeDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let address: String
    let lounge: Lounge
    
    func openAppleMaps() {
        let addressEncoded = address.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        if let url = URL(string: "http://maps.apple.com/?address=" + addressEncoded) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            } else {
                // Handle the case where Apple Maps can't be opened (e.g., on a simulator)
                print("Apple Maps cannot be opened.")
            }
        }
    }
    
    var body: some View {
        ScrollView {
            topImage(name: lounge.displayName)
            VStack {
                VStack (alignment: .leading) {
                    // Rating
                    HStack (spacing: 4) {
                        ForEach(0 ..< 5) { item in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                        Text(lounge.numRaiting.description)
                            .opacity(0.5)
                            .padding(.leading, 8)
                        Spacer()
                        Text("Capacity: 83/250")
                            .bold()
                            .foregroundColor(.white)
                            .fontWeight(.medium)
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.green)
                            )
                        
                        
                    }
                    .padding(.vertical, 1)
                    Button(action: {
                        openAppleMaps()
                    }) {
                        Text("Address: \n\(lounge.locationDescription)")
                            .multilineTextAlignment(.leading)
                    }
                    
                    //                    Text("Eligible Credit Cards:")
                    //                        .padding(.vertical, 1)
                    HStack {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(Color.green)
                        Text("Free Access for Business Class Tickets")
                            .fontWeight(.medium)
                            .padding(.vertical, 8)
                    }
                    Divider()
                    
                    Text(lounge.displayDescription)
                        .lineSpacing(8.0)
                        .opacity(0.6)
                }
                .padding()
                .frame(width: UIScreen.main.bounds.size.width, alignment: .leading)
                
                .background(Color.white)
                
                facilitiesView(availableFacilities: lounge.availableFacilities)
                
                //                Text("Facilities (Booking Required)")
                //                    .padding([.top, .leading, .trailing])
                //                    .frame(maxWidth: .infinity, alignment: .leading)
                //                Divider()
                //                    .padding(.horizontal)
                //                VStack(spacing: 10){
                //                    HStack(){
                //                        HStack(){
                //                            Image(systemName:"person.fill")
                //                            Text("Focus Rooms")
                //                        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment:.leading)
                //                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                //                            Text("Book")
                //                        })
                //                    }.padding([.leading, .trailing])
                //                }
                Text("Featured Photos")
                    .padding([.top, .leading, .trailing])
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                    .padding(.horizontal)
                
                featurePhotosView
            }
            
            
        }
        .edgesIgnoringSafeArea(.top)
        // custom back button
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading:
                                Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.backward")
        }
                            
            .foregroundColor(.black)
        )
        
        
    }
}

struct topImage: View {
    let name: String
    @State private var isPresentingFullView = false
    var body: some View {
        ZStack {
            Image("cathay_lounge")
                .resizable(resizingMode: .stretch)
                .frame(height:250)
                .edgesIgnoringSafeArea(.top)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [.clear, .white]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            VStack {
                Spacer()
                Text(name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("By The Cathay Group")
                    .font(.caption)
                    .fontWeight(.medium)
                    .padding(.horizontal)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading)
                    .padding(.bottom)
            }
            .frame(height:250)
            
            Button(action: {
                isPresentingFullView = true
            }, label: {
                Text("Navigate")
                    .foregroundColor(.white)
                    .padding(5)
                    .background(
                        Color.blue
                            .cornerRadius(20)
                    )
            })
            .fullScreenCover(isPresented: $isPresentingFullView) {
                MapNavigationView(dismissAction: {
                    isPresentingFullView = false
                }, destination: CLLocationCoordinate2D(latitude: 22.3142, longitude: 113.9246))
            }
            .offset(x: 140, y: -30)
            
        }
    }
}

var featurePhotosView: some View {
    ScrollView(.horizontal) {
        HStack(spacing: 10) {
            ForEach(0..<featuredPhotos.count) {
                item in
                Image(featuredPhotos[item])
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(4/3, contentMode: .fit)
                
                    .cornerRadius(20)
                    .frame(height:200)
            }
        }
        .padding()
        
    }
}

struct facilitiesDetailView: View {
    @Binding public var isPresentingFullView: Bool
    @State public var facility: Facility
    @State private var showConfirmAlert: Bool = false
    
    func JStimetoString(input: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = dateFormatter.date(from: input) {
            // Use the date object as needed
            print(date)
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            
            let dateString = dateFormatter.string(from: date)
            return dateString
        } else {
            print("Invalid date format")
        }
        
        return "Invalid Input"
    }
    
    func JStimetoString_timeonly(input: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = dateFormatter.date(from: input) {
            // Use the date object as needed
            print(date)
            dateFormatter.dateFormat = "HH:mm"
            
            let dateString = dateFormatter.string(from: date)
            return dateString
        } else {
            print("Invalid date format")
        }
        
        return "Invalid Input"
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment:.leading){
                
                Button {
                    isPresentingFullView = false
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .rotationEffect(.degrees(45))
                        .foregroundColor(.black)
                        .padding(.trailing)
                    
                }
//                                        .offset(x: UIScreen.main.bounds.width * 0.4)
                .padding(.bottom)
                Text(facility.displayName)
                    .font(.title)
                    .bold()

                Text("Description")
                    .bold()
                Divider()
                Text(facility.description)
                    .padding(_:[.bottom], 10)
                if (facility.availableTimeSlots.count > 0){
                    Text("Book")
                        .bold()
                    Divider()
                        
                    
                        ForEach(facility.availableTimeSlots)
                        {timeSlot in
                            HStack{
                            Text("\(JStimetoString(input: timeSlot.startTime)) - \(JStimetoString_timeonly(input: timeSlot.endTime))")
                                Spacer()
                                Button("Book"){
                                    showConfirmAlert = true
                                }
                                .alert(
                                    Text("Confirm Booking"),
                                    isPresented: $showConfirmAlert
                                ){
                                    Button{
                                        showConfirmAlert = false
                                    } label: {
                                        Text("Confirm")
                                    }
                                    Button("Cancel"){
    
                                    }
                                }

                        }
                    }
                } else {
                    Text("Booking not required")
                        .bold()
                }
                
                    
                    
                
                }
            .padding(.horizontal)
                
        }
        .transition(.move(edge: .leading))
    }
    
}

struct facilitiesView: View {
    let availableFacilities: [Facility]
    @State private var isPresentingFullView = false
    @State private var facilitiyNum = 0;
    
    var body: some View {
        
        VStack {
            Text("Facilities")
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
                .padding(.horizontal)
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(0..<availableFacilities.count, id: \.self) { index in
                    HStack {
                        //                    Image(systemName: grids[index].0)
                        //                        .frame(width: 20)
                        Button(availableFacilities[index].displayName){
                            isPresentingFullView = true
                            facilitiyNum = index
                        }
                        .opacity(0.7)
                        .fullScreenCover(isPresented: $isPresentingFullView) {
                            facilitiesDetailView(isPresentingFullView: $isPresentingFullView, facility: availableFacilities[facilitiyNum])
                        }
                    }
                    
                }
            }
            .padding(.horizontal)
        }
    }
}

struct LoungeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LoungeDetailView(address: "Gate W65, Hong Kong International Airport, Terminal 1, 6 Sky Plaza Rd, Lantau Island", lounge: SampleData().getData[0].loungeList[0])
    }
}
