//
//  Test.swift
//  LoungePass
//
//  Created by Rain Poon on 31/10/2023.
//

import SwiftUI

struct Test: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Main View")
                
                NavigationLink(destination: DetailView()) {
                    Text("Go to Detail View")
                }
            }
            .navigationBarTitle("Title", displayMode: .inline)
            .navigationBarItems(leading: backButton)
        }
    }
    
    var backButton: some View {
        Button(action: {
            // Handle back button action here
        }) {
            Image(systemName: "chevron.left")
            Text("Back")
        }
    }
}

struct DetailView: View {
    var body: some View {
        VStack {
            Text("Detail View")
        }
        .navigationBarTitle("Detail", displayMode: .inline)
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
