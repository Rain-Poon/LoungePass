//
//  ContentView.swift
//  LoungePass
//
//  Created by Rain Poon on 31/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomePageView()
                .tabItem(){
                    Label("My Flights", systemImage:"airplane.departure")
                }
            
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
