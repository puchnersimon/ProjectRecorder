//
//  ProjectViewModel.swift
//  ProjectRecorder
//
//  Created by Simon Puchner on 30.06.22.
//

import SwiftUI

class ProjectViewModel: ObservableObject {
    @Published var projects: [Project] = []
    
    
    
    func addProject(projectname: String) {
        guard !projectname.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        projects.append(Project(ProjectName: projectname))
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
