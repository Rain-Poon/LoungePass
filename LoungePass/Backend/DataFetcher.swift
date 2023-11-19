//
//  DataFetcher.swift
//  DineNoSore
//
//  Created by Rain Poon on 14/11/2023.
//

import Foundation
import SwiftUI

class DataFetcher: ObservableObject {
    @Published var states: Notification = Notification()
    @Published var text: String = ""
    @Published var flag: Bool = false
    @Published var endpoint: String = ""
    @Published var views: [AnyView] = [
        AnyView(SelectLoungeView(airport: SampleData().getData[0])),
        AnyView(LoungeDetailView(address: "Gate W65, Hong Kong International Airport, Terminal 1, 6 Sky Plaza Rd, Lantau Island", lounge: SampleData().getData[0].loungeList[0], occupy: Double(Int.random(in: 100..<250)), max: Double(Int.random(in: 200..<250)))),
        AnyView(LoungeDetailView(address: "Gate W65, Hong Kong International Airport, Terminal 1, 6 Sky Plaza Rd, Lantau Island", lounge: SampleData().getData[0].loungeList[4], occupy: Double(Int.random(in: 100..<250)), max: Double(Int.random(in: 200..<250)))),
        AnyView(LoungeDetailView(address: "Gate W65, Hong Kong International Airport, Terminal 1, 6 Sky Plaza Rd, Lantau Island", lounge: SampleData().getData[0].loungeList[2], occupy: Double(Int.random(in: 100..<250)), max: Double(Int.random(in: 200..<250)))),
        AnyView(LoungeDetailView(address: "Gate W65, Hong Kong International Airport, Terminal 1, 6 Sky Plaza Rd, Lantau Island", lounge: SampleData().getData[0].loungeList[3], occupy: Double(Int.random(in: 100..<250)), max: Double(Int.random(in: 200..<250)))),
        AnyView(SelectLoungeView(airport: SampleData().getData[1]))
        
    ]
    @Published var viewToShow: AnyView = AnyView(Spacer())
    
    private var timer: Timer?
    
    init() {
        // Start the timer to trigger the initial data fetch
        startTimer()
    }
    
    func startTimer() {
        // Invalidate the existing timer if any
        timer?.invalidate()
        
        // Schedule a new timer to trigger the data fetch every 10 seconds
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { [weak self] _ in
            self?.fetchData()
        }
        
        // Fetch the initial data immediately
        fetchData()
    }
    
    func setAllFalse() {
        self.states.tryNew = false
        self.states.oneDayPrior = false
        self.states.arriveAirport = false
        self.states.boardingGateConfirmed = false
        self.states.oneHourPriorBoarding = false
        self.states.thirtyMinPriorBoarding = false
        self.states.postFlight = false
    }
    
    func fetchData() {
        // Perform the HTTP request to fetch the latest data
        guard let url = URL(string: "http://127.0.0.1:8080/getstates") else {
            return // Handle invalid URL
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data else {
                return // Handle error
            }
            
            do {
                // Decode the fetched data into an array of `Post` objects
                let decoder = JSONDecoder()
                let fetchedPost = try decoder.decode(Notification.self, from: data)
                print(fetchedPost)
                
                self?.flag = [\Notification.tryNew, \Notification.oneDayPrior, \Notification.arriveAirport, \Notification.boardingGateConfirmed, \Notification.oneHourPriorBoarding, \Notification.thirtyMinPriorBoarding, \Notification.postFlight].contains { keyPath in
                    fetchedPost[keyPath: keyPath]
                }
                
                self?.states = fetchedPost
                
                if (self?.states.tryNew == true) {
                    self?.text = "Try out our new features!"
                    self?.endpoint = "trynew"
                    self?.viewToShow = (self?.views[0])!
                } else if ((self?.states.oneDayPrior) == true) {
                    self?.text = "It’s self-pamper time! Try out our top-notch massage services at The Pier, First!"
                    self?.endpoint = "onedayprior"
                    self?.viewToShow = (self?.views[1])!
                } else if ((self?.states.arriveAirport) == true) {
                    self?.text = "Check out today’s lovely sunset at The Deck with us!"
                    self?.endpoint = "arriveairport"
                    self?.viewToShow = (self?.views[2])!
                } else if ((self?.states.boardingGateConfirmed) == true) {
                    print("here")
                    self?.text = "Take a break from your hectic schedule - The Wing, First is just a minute walk from your Departure Gate 2."
                    self?.endpoint = "boardinggateconfirmed"
                    self?.viewToShow = (self?.views[3])!
                } else if ((self?.states.oneHourPriorBoarding) == true) {
                    self?.text = "Come and get a sneak peek at where MIRROR shot their latest MV at The Wing, Business!"
                    self?.endpoint = "onehourpriorboarding"
                    self?.viewToShow = (self?.views[4])!
                } else if ((self?.states.thirtyMinPriorBoarding) == true) {
                    self?.text = "30 mins to the flight!"
                    self?.endpoint = "thirtyminpriorboarding"
                } else if ((self?.states.postFlight) == true) {
                    self?.text = "Thanks for taking Cathay Pacific's flight! Click to see lounges for next flight!"
                    self?.endpoint = "postflight"
                    self?.viewToShow = (self?.views[5])!
                }
                
            } catch {
                // Handle decoding error
            }
        }.resume()
    }
}
