//
//  Project.swift
//  ProjectRecorder
//
//  Created by Simon Puchner on 30.06.22.
//

import SwiftUI

struct Project: Identifiable {
    let id = UUID()
    var projectName: String
    var symbol: Image? = nil
    var recordingList: [ProjectRecordingData] = []
    var fullRecordingTime = 0
    var isRecording = false
    var timerManager = TimerManager()
    
    init(projectName: String) {
        self.projectName = projectName
    }
    
    init(projectName: String, symbol: Image) {
        self.projectName = projectName
        self.symbol = symbol
    }
}

struct ProjectRecordingData {
    var date: Date
    var timeStart: Date
    var recordingTime: Double
    var description: String
    
    
}
