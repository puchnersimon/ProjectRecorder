//
//  ProjectViewModel.swift
//  ProjectRecorder
//
//  Created by Simon Puchner on 30.06.22.
//

import SwiftUI

class ProjectViewModel: ObservableObject {
    @Published var projects: [Project] = [
        Project(projectName: "IOS", symbol: Image(systemName: "applelogo")),
        Project(projectName: "WIA", symbol: Image(systemName: "list.dash")),
        Project(projectName: "OIS", symbol: Image(systemName: "map")),
        Project(projectName: "HNP", symbol: Image(systemName: "hand.thumbsdown"))
    ]
    
    
    
    
    
    func addProject(projectname: String) {
        guard !projectname.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        projects.append(Project(projectName: projectname))
    }
    
    
    func deleteProject(at offsets: IndexSet) {
        projects.remove(atOffsets: offsets)
    }
    
    func toggleRecording(id: UUID) {
        for (index, project) in projects.enumerated() {
            if project.id == id {
                projects[index].isRecording.toggle()
            }
        }
    }
    
}
