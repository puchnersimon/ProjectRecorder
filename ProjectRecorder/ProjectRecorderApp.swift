//
//  ProjectRecorderApp.swift
//  ProjectRecorder
//
//  Created by Simon Puchner on 30.06.22.
//

import SwiftUI

@main
struct ProjectRecorderApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            TabView {
                ProjectsView()
                    .tabItem {
                        Label("Projects", systemImage: "list.bullet.rectangle.portrait")
                    }
                CalendarView()
                    .tabItem {
                        Label("Calendar", systemImage: "calendar")
                    }
                StatisticsView()
                    .tabItem {
                        Label("Statistics", systemImage: "align.vertical.bottom")
                    }
            }
            
            
            /*
             ContentView()
             .environment(\.managedObjectContext, persistenceController.container.viewContext)
             */
        }
    }
}
