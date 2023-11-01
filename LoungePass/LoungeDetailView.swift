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
    var body: some View {
        VStack {
            ZStack {
                Image("cathay_lounge")
                    .resizable(resizingMode: .stretch)
                    .frame(height:250)
                    .edgesIgnoringSafeArea(.top)
                    .overlay(
                        Color(.white)
                            .opacity(0.5)
                    )
                VStack {
                    Spacer()
                    Text("CATHAY LOUNGE")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
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
                        .padding(5)
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
                
                Text("Luxury Swedian Chair is a contemporary chair based on the virtues of modern craft. it carries on the simplicity and honestly of the archetypical chair.")
                    .lineSpacing(8.0)
                    .opacity(0.6)
            }
            .padding()
            .frame(width: UIScreen.main.bounds.size.width)
            .background(Color.white)
            Spacer()
            
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
