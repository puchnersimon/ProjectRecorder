//
//  TimerManager.swift
//  ProjectRecorder
//
//  Created by Simon Puchner on 30.06.22.
//

import SwiftUI

class TimerManager: ObservableObject {
    @Published var seconds = 0
    @Published var minutes = 0
    @Published var hours = 0
    private let test = "abc1"
    var timer = Timer()
    
    func timerStart() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.seconds += 1
            
            if (self.seconds == 60) {
                self.minutes += 1
                self.seconds = 0
            }
            
            if (self.minutes == 60) {
                self.hours += 1
                self.minutes = 0
            }
        }
    }
    
    func timerStop() {
        timer.invalidate()
        self.seconds = 0
        self.minutes = 0
        self.hours = 0
    }
    
}
