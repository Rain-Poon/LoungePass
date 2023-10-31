//
//  HomePageView.swift
//  LoungePass
//
//  Created by Rain Poon on 31/10/2023.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        ZStack {
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
        }
        
        
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
