//
//  SearchView.swift
//  LoungePass
//
//  Created by Vicky on 1/11/2023.
//

import SwiftUI

struct SearchView: View {
    @State private var input = ""
    var body: some View {
        VStack {
            Spacer()
            Text("Lounge search")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(alignment: .leading)
                
            
            NavigationView(content: {
                ScrollView{
                    NavigationLink(destination:SearchResultView()){
                        Text("go to result 1")
                    }
                }
            }).searchable(text: $input, prompt: "Search by airport")
            
            }

    }
}
#Preview {
    SearchView()
}
