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
    @Published var clickText: String = ""
    @Published var flag: Bool = false
    @Published var endpoint: String = ""
    
    private var timer: Timer?
    
    init() {
        // Start the timer to trigger the initial data fetch
        startTimer()
    }
    
    func startTimer() {
        // Invalidate the existing timer if any
        timer?.invalidate()
        
        // Schedule a new timer to trigger the data fetch every 10 seconds
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] _ in
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
                    self?.text = "Try our new features!"
                    self?.clickText = "Check it out"
                    self?.endpoint = "trynew"
                } else if ((self?.states.oneDayPrior) == true) {
                    self?.text = "There's only one day left to the flight!"
                    self?.clickText = "Click to see the available lounges"
                    self?.endpoint = "onedayprior"
                } else if ((self?.states.arriveAirport) == true) {
                    self?.text = "Welcome to Hong Kong International Airport!"
                    self?.clickText = "Click to see the available lounges"
                    self?.endpoint = "arriveairport"
                } else if ((self?.states.boardingGateConfirmed) == true) {
                    print("here")
                    self?.text = "Boarding gate is confirmed."
                    self?.clickText = "Click to see the lounges near to the boarding gate"
                    self?.endpoint = "boardinggateconfirmed"
                } else if ((self?.states.oneHourPriorBoarding) == true) {
                    self?.text = "One hour to the flight!"
                    self?.clickText = "Click to see the available lounges"
                    self?.endpoint = "onehourpriorboarding"
                } else if ((self?.states.thirtyMinPriorBoarding) == true) {
                    self?.text = "30 mins to the flight!"
                    self?.clickText = "Click to see the available lounges"
                    self?.endpoint = "thirtyminpriorboarding"
                } else if ((self?.states.postFlight) == true) {
                    self?.text = "Thanks for taking Cathay Pacific's flight"
                    self?.clickText = "Click to see lounges for next flight"
                    self?.endpoint = "postflight"
                }
                
            } catch {
                // Handle decoding error
            }
        }.resume()
    }
}
