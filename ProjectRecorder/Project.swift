//
//  Project.swift
//  ProjectRecorder
//
//  Created by Simon Puchner on 30.06.22.
//

import SwiftUI

struct Project: Identifiable {
    let id = UUID()
    var ProjectName: String
    var symbol: Image? = nil
    var timeList: [Timer] = []
    var FullTime = 0
    var isRecording = false
    
    init(ProjectName: String) {
        self.ProjectName = ProjectName
    }
    
    init(ProjectName: String, symbol: Image) {
        self.ProjectName = ProjectName
        self.symbol = symbol
    }
}
