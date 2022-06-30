//
//  StatisticsDetailView.swift
//  ProjectRecorder
//
//  Created by Simon Puchner on 30.06.22.
//

import SwiftUI

struct StatisticsDetailView: View {
    var body: some View {
        VStack {
            
            Text("Project iOS:")
                .underline()
                .padding()
                .font(.system(size: 15))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.gray)
            VStack {
                Image(systemName: "align.vertical.bottom")
                    .resizable()
                    .frame(width: 250, height: 250, alignment: .center)
                    .border(.white, width: 5)
                
                HStack {
                    Text("Total Worktime:")
                    Spacer()
                    Text("34:12:56")
                }
                .padding()
                HStack {
                    Text("Sessions:")
                    Spacer()
                    Text("18")
                }
                .padding()
            }
            Spacer()
        }
        
    }
}

struct StatisticsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsDetailView()
    }
}
