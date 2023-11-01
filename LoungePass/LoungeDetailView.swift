//
//  LoungeDetailView.swift
//  LoungePass
//
//  Created by Rain Poon on 31/10/2023.
//

import SwiftUI

//
//  DetailedView.swift
//  Revolatus
//
//  Created by Rain Poon on 12/9/2023.
//

import SwiftUI

struct LoungeDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let columns = [
        GridItem(.flexible(), alignment: .leading),
        GridItem(.flexible(), alignment: .leading)
    ]
    let grids = [
        ("person.fill", "250 Seats"),
        ("chair.lounge.fill", "20 Sleeping Chairs"),
        ("studentdesk", "20 Working Desks"),
        ("shower.fill", "5 Showers"),
        ("powerplug.fill", "10 Charging Ports"),
        ("table.furniture.fill", "40 Dining Tables")
    ]
    let featuredPhotos = ["cathay_lounge_1", "cathay_lounge_2", "cathay_lounge_3"]
    var body: some View {
        ScrollView {
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
                    Text("Cathay Lounge")
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
            }
            
            
            VStack (alignment: .leading) {
                // Rating
                HStack (spacing: 4) {
                    ForEach(0 ..< 5) { item in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    Text("(4.9)")
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
                Text("Address: \nGate W65, Hong Kong International Airport, Terminal 1, 6 Sky Plaza Rd, Lantau Island")
                Text("Eligible Credit Cards:")
                    .padding(.vertical, 1)
                HStack {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(Color.green)
                    Text("Free Access for Business Class Tickets")
                        .fontWeight(.medium)
                        .padding(.vertical, 8)
                }
                Divider()
                
                Text("A home away from home. Sink into our designer chairs, relax, and enjoy views of the runway and terminal interior. Stay connected.")
                    .lineSpacing(8.0)
                    .opacity(0.6)
            }
            .padding()
            .frame(width: UIScreen.main.bounds.size.width)
            .background(Color.white)
            
            Text("Facilities")
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
                .padding(.horizontal)
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(0..<grids.count, id: \.self) { item in
                    HStack {
                        Image(systemName: grids[item].0)
                            .frame(width: 20)
                        Text(grids[item].1)
                            .opacity(0.7)
                    }
                }
            }
            .padding(.horizontal)
            Text("Facilities (Booking Required")
                .padding([.top, .leading, .trailing])
                .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
                .padding(.horizontal)
            Text("Featured Photos")
                .padding([.top, .leading, .trailing])
                .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
                .padding(.horizontal)
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

struct LoungeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LoungeDetailView()
    }
}
