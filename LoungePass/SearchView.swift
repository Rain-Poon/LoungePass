//
//  SearchView.swift
//  LoungePass
//
//  Created by Vicky on 1/11/2023.
//

import SwiftUI

struct SearchView: View {
    @State private var input = ""
    @State private var searchactive = false
    let airports = ["LHR", "HKG", "NRT", "ICN", "LAX"]
    
    var body: some View {
        NavigationView(content: {
            NavigationStack {
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
            }.navigationTitle("Lounge Search").searchable(text: $input, prompt: "Search by airport")
        })
        
        
    }
    
    
}
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
