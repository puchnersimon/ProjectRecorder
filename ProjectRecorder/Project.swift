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
    var FullTime = 0
    var isRecording = false
}
