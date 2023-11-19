//
//  NotificationPopUp.swift
//  LoungePass
//
//  Created by Rain Poon on 18/11/2023.
//

import SwiftUI
import MapKit

struct NotificationPopUp: View {
    
    @StateObject private var dataFetcher = DataFetcher()
    @State private var isPresentingFullView: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                if (dataFetcher.flag) {
                    NavigationLink(destination: dataFetcher.viewToShow) {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(red: 0.8, green: 0.8, blue: 0.8))
                            .frame(
                                width: UIScreen.main.bounds.width * 0.9,
                                height: UIScreen.main.bounds.height * 0.1
                            )
                            .transition(.asymmetric(
                                insertion: .move(edge: .top),
                                removal: .move(edge: .top)
                            ))
                            .animation(.easeInOut(duration: 0.3))
                            .overlay {
                                ZStack {
                                    Button(action: {
                                        dataFetcher.setAllFalse()
                                        sendRequest(endpoint: dataFetcher.endpoint)
                                        dataFetcher.flag = false
                                    }, label: {
                                        Image(systemName: "plus.circle.fill")
                                            .foregroundColor(.black)
                                            .rotationEffect(.degrees(45))
                                    })
                                    
                                    .frame(
                                        width: UIScreen.main.bounds.width * 0.9,
                                        height: UIScreen.main.bounds.height * 0.1
                                    )
                                    .offset(x: UIScreen.main.bounds.width * 0.4, y: -UIScreen.main.bounds.height * 0.025)
                                    VStack() {
                                        Text(dataFetcher.text)
                                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                            .foregroundColor(.white)
                                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                    }
                                    .padding()
                                    
                                }
                                
                            }
                    }
                    
                    
                    Spacer()
                }
                
                
                
            }
        }
        
    }
    
    func sendRequest(endpoint: String) {
        // Create the URL for your request
        guard let url = URL(string: "http://127.0.0.1:8080/\(endpoint)") else {
            return
        }
        
        // Create the URL request
        var request = URLRequest(url: url)
        request.httpMethod = "GET" // or "POST" if applicable
        
        // Create a URLSession data task
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // Handle the response and error
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                // Parse the response data as needed
                if let responseString = String(data: data, encoding: .utf8) {
                    print(responseString)
                }
            }
        }
        
        // Start the data task
        task.resume()
    }
}

#Preview {
    NotificationPopUp()
}
