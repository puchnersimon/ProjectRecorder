//
//  ProjectsView.swift
//  ProjectRecorder
//
//  Created by Simon Puchner on 30.06.22.
//

import SwiftUI

struct ProjectsView: View {
    
    @ObservedObject var viewModel = ProjectViewModel()
    
    @State var showAlert = false
   // @State var isRecording = false
    @State var projectname = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Section {
                    TextField("create new project...", text: $projectname)
                        .padding()
                        .multilineTextAlignment(.center)
                        .frame(width: 350, height: 50, alignment: .center)
                    
                    Button {
                        viewModel.addProject(projectname: projectname)
                    } label: {
                        Text("add project")
                            .frame(width: 130, height: 35, alignment: .center)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                
                List {
                    ForEach (viewModel.projects, id: \.id) { project in
                        
                        HStack {
                            Label {
                                Text(project.ProjectName)
                            } icon: {
                                Image(systemName: "square")
                            }
                            
                            Spacer()
                            
                            Image(systemName: project.isRecording ? "stop.circle.fill" : "play.circle.fill")
                                .foregroundColor(project.isRecording ? .red : .green)
                                .frame(width: 40, height: 40, alignment: .center)
                                .onTapGesture {
                                    viewModel.toggleRecording(id: project.id)
                                    //project.isRecording.toggle()
                                }
                        }
                    }
                    .onDelete(perform: delete)
                }
            }
            .navigationBarTitle("Projects")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        viewModel.deleteProject(at: offsets)
    }
}

struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsView()
    }
}
