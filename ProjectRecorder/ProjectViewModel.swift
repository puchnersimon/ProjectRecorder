//
//  ProjectViewModel.swift
//  ProjectRecorder
//
//  Created by Simon Puchner on 30.06.22.
//

import SwiftUI

class ProjectViewModel: ObservableObject {
    @Published var projects: [Project] = [
        Project(projectName: "iOS", symbol: Image(systemName: "applelogo")),
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
    
    func saveRecoding(id: UUID, recTime: String, description: String) {
        for (index, project) in projects.enumerated() {
            if project.id == id {
                
                let hours: Double? = Double(recTime.prefix(2))
                let  minutesString = recTime.prefix(5)
                let  minutes: Double? = Double(minutesString.suffix(2))
                let seconds: Double? = Double(recTime.suffix(2))
                
                let recordedTimeInSeconds = (hours ?? 0.0) * 60.0 + (minutes ?? 0.0) * 60.0 + (seconds ?? 0.0)
                
                
                projects[index].recordingList.append(ProjectRecordingData(date: Date.now, timeStart: Date.now, recordingTime: recordedTimeInSeconds, description: description))
                print(projects[index].recordingList)
                
            }
        }
    }
    
}
