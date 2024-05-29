//
//  ContentView.swift
//  JTAppleCalendarTuts
//
//  Created by Roro on 29/04/24.
//

import SwiftUI
import JTAppleCalendar

struct CalendarView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> JTACMonthView {
        let calendarView = JTACMonthView()
        return calendarView
    }
    
    func updateUIView(_ uiView: JTACMonthView, context: Context) {
        // Update the calendar view if needed
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("My Calendar")
            CalendarView()
                .frame(height: 300)
        }
    }
}


#Preview {
    ContentView()
}
