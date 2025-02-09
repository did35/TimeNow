//
//  ContentView.swift
//  TimeNow
//
//  Created by Didier Delhaisse on 09/02/2025.
//

import SwiftUI

struct ContentView: View {
    /// Monitors app lifecycle state (commented out when using timer).
    /// `@Environment(\.scenePhase) var scenePhase`
    
    /// Store the current time, triggering UI updates when changed.
    @State private var currentTime = Date()
    
    /// Determines whether the current time is AM or PM.
    var amPmIndicator: String {
        return Calendar.current.component(.hour, from: currentTime) < 12 ? "AM" : "PM"
    }
    
    var body: some View {
        VStack(spacing: 80) {
            /// Display the current time with AM/PM suffix.
            Text("\(.now, style: .time) \(amPmIndicator)")
            /// Display the current date.
            Text(.now, style: .date)
        }
        .font(.largeTitle)
        
        /// ✅ **Option1: Using Timer for real-time updates (recommended for a clock display).**
        .onAppear {
            startTimer()
        }
        
        /// ✅ **Option 2:  Using `scenePhase` to update only when app becomes active.**
        ///  This approach reduces unecessary updates, making it more efficient.
        /*
        .onChange(of: scenePhase) { _, newPhase in
            if newPhase == .active {
                currentTime = Date()
            }
        }
         */
    }
    
    /// Starts Timer to update `currentTime` every second.
    ///  - Updates the UI every second, keeping time accurate.
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            currentTime = Date()
        }
    }
}

#Preview {
    ContentView()
}
