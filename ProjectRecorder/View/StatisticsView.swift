//
//  StatisticsView.swift
//  ProjectRecorder
//
//  Created by Simon Puchner on 30.06.22.
//

import SwiftUI

struct StatisticsView: View {
    
    @ObservedObject var viewModel = ProjectViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach (viewModel.projects, id: \.id) { project in
                    NavigationLink(destination: StatisticsDetailView()) {
                        HStack {
                            project.symbol
                            Text(project.projectName)
                                .padding()
                                .font(.title)
                        }
                    }
                    
                    
                }
                
            }
            .navigationBarTitle("Statistics")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
