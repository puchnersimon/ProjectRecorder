//
//  ProjectsView.swift
//  ProjectRecorder
//
//  Created by Simon Puchner on 30.06.22.
//

import SwiftUI

struct Project: Identifiable {
    let id = UUID()
    var ProjectName: String
    var FullTimec = 0
    var isRecording = false
}

struct ProjectData {
    static var data = [
        Project(ProjectName: "Pro4"),
        Project(ProjectName: "IOS"),
        Project(ProjectName: "WIA")
        ]
}


struct ProjectsView: View {
    
    @State var demoData = ProjectData.data
    @State var showAlert = false
    @State var isRecording = false
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
                        addProject()
                    } label: {
                        Text("add project")
                            .frame(width: 130, height: 35, alignment: .center)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                                                }
                }
                
                List {
                    ForEach (demoData, id: \.id) { item in
                        
                        HStack {
                            Label {
                                Text(item.ProjectName)
                            } icon: {
                                Image(systemName: "square")
                            }
                            
                            Spacer()
                            
                            Image(systemName: isRecording ? "stop.circle.fill" : "play.circle.fill")
                                .foregroundColor(isRecording ? .red : .green)
                                .frame(width: 40, height: 40, alignment: .center)
                                .onTapGesture {
                                    isRecording.toggle()
                                }
                            /*
                            Button {
                                showAlert = true
                                print("buttonpress")
                            } label: {
                                Image(systemName: "play.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.green)
                                    
                                    
                            }
                             */
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
            demoData.remove(atOffsets: offsets)
        }
    
    func addProject() {
        guard !projectname.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        demoData.append(Project(ProjectName: projectname))
        projectname = ""
        
    }
    
}

struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsView()
    }
}
