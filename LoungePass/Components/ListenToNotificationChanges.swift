//
//  PostNotificationView.swift
//  LoungePass
//
//  Created by Rain Poon on 18/11/2023.
//

import SwiftUI
import UserNotifications


struct ListenToNotificationChanges: View {
    
    @State private var showingAlert = false
    
    var body: some View {
        VStack(spacing: 10) {
            Button("Request Permission") {
                NotificationManager.shared.requestAuthorization()
            }
            
            var noti = "Thanks for buying a flight ticket"
            Button(noti) {
                NotificationManager.shared.scheduleNotification(trigger: .time, body: noti)
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    showingAlert = true
                }
            }
            .alert("Important message", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
        }
        .onAppear{
            UIApplication.shared.applicationIconBadgeNumber  = 0
        }
    }
    
}

struct ListenToNotificationChanges_Previews: PreviewProvider {
    static var previews: some View {
        ListenToNotificationChanges()
    }
}
