//
//  FreeAccessView.swift
//  LoungePass
//
//  Created by Rain Poon on 31/10/2023.
//

import SwiftUI

struct FreeAccessView: View {
    var body: some View {
        // Navigation View is not defined here. Go to the main app to access the sub pages
//        NavigationView {
            ScrollView {
                // firt lounge
                NavigationLink(destination: LoungeDetailView()) {
                    ZStack {
                        Image("cathay_lounge")
                            .resizable(resizingMode: .stretch)
                            .frame(width: UIScreen.main.bounds.size.width-50, height: 170
                            )
                            .cornerRadius(10)
                            .blur(radius: 2)
                            .opacity(0.7)
                            .overlay(Color(.black).opacity(0.3))
                        VStack(alignment: .trailing) {
                            HStack(content: {
                                    Image(systemName: "person.fill")
                                        .foregroundColor(.white)
                                    Text("83/250")
                                        .bold()
                                        .foregroundColor(.white)
                                        .fontWeight(.medium)
                            })
                            .frame(alignment: .trailing)
                                .padding(10)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.green)
                                )
                            
                            Spacer()
                            Text("Cathay Lounge")
                                .foregroundColor(.white)
                                .font(.title2)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            HStack(alignment: .top, content: {
                                Text("0.5 km away")
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                                           alignment: .leading
                                    )
                                    .foregroundColor(.white)
                                    .bold()
                            })
                            
                        }
                        .frame(width: UIScreen.main.bounds.width-100, height: 130)
                        
                    }
                    .padding(.vertical)
                }
                
                
                // second lounge
                ZStack {
                    Image("plaza_premium_lounge")
                        .resizable(resizingMode: .stretch)
                        .frame(width: UIScreen.main.bounds.size.width-50, height: 170
                        )
                        .cornerRadius(10)
                        .blur(radius: 2)
                        .opacity(0.7)
                    VStack() {
                        
                        HStack {
                            Image(systemName: "person.fill")
                            Text("163")
                                .fontWeight(.bold)
                                .foregroundColor(Color.orange)
                            Text("/250")
                        }
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        Spacer()
                        Text("PLAZA PREMIUM LOUNGE")
                            .font(.title2)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(width: UIScreen.main.bounds.width-100, height: 130)
                    
                }
                .padding(.vertical)
            }
//        }
        
    }
}

struct FreeAccessView_Previews: PreviewProvider {
    static var previews: some View {
        FreeAccessView()
    }
}
