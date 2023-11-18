//
//  BannerView.swift
//  LoungePass
//
//  Created by Rain Poon on 18/11/2023.
//

import SwiftUI

struct CustomScreen: View {
    
    @State private var showView: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            
            VStack {
                Spacer()
                Button("Show Alert") {
                    withAnimation { showView.toggle() }
                }
                Spacer()
            }
            
            if showView {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.blue)
                    .frame(
                        width: UIScreen.main.bounds.width * 0.9,
                        height: UIScreen.main.bounds.height * 0.1
                    )
                    .transition(.asymmetric(
                        insertion: .move(edge: .top),
                        removal: .move(edge: .top)
                    ))
                    .overlay {
                        Button(action: {
                            showView.toggle()
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.black)
                                .rotationEffect(.degrees(45))
                        })
                        
                        .frame(
                            width: UIScreen.main.bounds.width * 0.9,
                            height: UIScreen.main.bounds.height * 0.1
                        )
                        .offset(x: UIScreen.main.bounds.width * 0.4, y: -UIScreen.main.bounds.height * 0.02)
                        
                        
                    }
            }
        }
    }
}

#Preview {
    CustomScreen()
}
