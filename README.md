## 🕰 SwiftUI Real-Time Clock

**📌 Overview**

This SwiftUI app displays the current time and date while dynamically updating the AM/PM indicator. The app supports two update methods:

**Real-time updates** with a Timer (for clock-style updates)

**Scene phase updates** (only updates when the app becomes active, for efficiency)

## 📸 Screenshot

<img width="180" src="https://github.com/user-attachments/assets/5a53fc3f-3da9-4d7c-85ee-1afcfdf50154" />


## ✨ Features

- Displays the current time with an AM/PM indicator

- Shows the current date in a large font

- Two update strategies:

**Real-time updating** every second (Timer-based)

**Optimized update** when app becomes active (Scene phase detection)

## 🛠 Installation & Usage

- Clone this repository: [git clone](https://github.com/did35/TimeNow.git)

- Open ContentView.swift in Xcode.

- Run the project in the iOS Simulator or on a physical device.

## 📝 Code Breakdown

Main View (ContentView.swift)

``` Swift
import SwiftUI

struct ContentView: View {
    @State private var currentTime = Date()
    
    var amPmIndicator: String {
        return Calendar.current.component(.hour, from: currentTime) < 12 ? "AM" : "PM"
    }
    
    var body: some View {
        VStack(spacing: 80) {
            Text("\(currentTime, style: .time) \(amPmIndicator)")
            Text(currentTime, style: .date)
        }
        .font(.largeTitle)
        
        /// ✅ Option 1: Real-time updates (recommended for a clock display)
        .onAppear {
            startTimer()
        }
        
        /*
        /// ✅ Option 2: Update only when app becomes active (better performance)
        .onChange(of: scenePhase) { _, newPhase in
            if newPhase == .active {
                currentTime = Date()
            }
        }
        */
    }
    
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            currentTime = Date()
        }
    }
}
```

## 🚀 Choosing the Best Update Method

<img width="800" src="https://github.com/user-attachments/assets/16a97467-bdac-46b0-a12f-4c1a07dedb25" />


## 🔧 Customization

- Change the Timer interval for less frequent updates (e.g., every 60 seconds for efficiency).

- Modify the amPmIndicator logic to use a localized format if needed.

- Update the font, color, or layout to match your design preferences.

## 🏗 Future Enhancements

- Add user settings to toggle between 12-hour and 24-hour formats.

- Implement dark mode support.

- Use localized formatting for different regions.

## 📜 License

This project is open-source under the MIT License. Feel free to modify and use it in your projects.

👨‍💻 Author

Developed by [Didier Delhaisse](https://github.com/did35) – SwiftUI enthusiast 🚀
