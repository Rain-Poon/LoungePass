//
//  FreeAccessView.swift
//  LoungePass
//
//  Created by Rain Poon on 31/10/2023.
//

import SwiftUI

struct FreeAccessView: View {
    var body: some View {
        ScrollView {
            // firt lounge
            ZStack {
                Image("cathay_lounge")
                    .resizable(resizingMode: .stretch)
                    .frame(width: UIScreen.main.bounds.size.width-50, height: 170
                    )
                    .cornerRadius(10)
                    .blur(radius: 2)
                    .opacity(0.7)
                VStack() {
                    
                    HStack {
                        Image(systemName: "person.fill")
                        Text("83")
                            .fontWeight(.bold)
                            .foregroundColor(Color.green)
                        Text("/250")
                    }
                    .padding(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.blue, lineWidth: 2)
                    )
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    Spacer()
                    Text("CATHAY LOUNGE")
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(width: UIScreen.main.bounds.width-100, height: 130)
                
            }
            .padding(.vertical)
            
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
    }
}

struct FreeAccessView_Previews: PreviewProvider {
    static var previews: some View {
        FreeAccessView()
    }
}
