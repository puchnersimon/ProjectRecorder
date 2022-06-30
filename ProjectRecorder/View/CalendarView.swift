//
//  CalendarView.swift
//  ProjectRecorder
//
//  Created by Simon Puchner on 30.06.22.
//

import SwiftUI

struct CalendarView: View {
    
    @State var selectedDate: Date = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("calendar", selection: $selectedDate)
                    .padding()
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                Text("Events:")
                    .underline()
                    .padding()
                    .font(.system(size: 15))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.gray)
                
                Spacer()
    
            }
            .navigationBarTitle("Calendar")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
