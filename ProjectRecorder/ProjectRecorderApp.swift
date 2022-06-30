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
                ProjectsView()
                    .tabItem {
                        Label("Calendar", systemImage: "calendar")
                    }
                ProjectsView()
                    .tabItem {
                        Label("Account", systemImage: "person")
                    }
            }
            
            
            /*
             ContentView()
             .environment(\.managedObjectContext, persistenceController.container.viewContext)
             */
        }
    }
}
