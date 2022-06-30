//
//  TimerManager.swift
//  ProjectRecorder
//
//  Created by Simon Puchner on 30.06.22.
//

import SwiftUI

class TimerManager: ObservableObject {
    @Published var secondElapsed = 0.9
    var timer = Timer()
    
    func timerStart() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.secondElapsed += 0.1
        }
    }
}
