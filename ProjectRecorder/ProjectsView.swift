//
//  ProjectsView.swift
//  ProjectRecorder
//
//  Created by Simon Puchner on 30.06.22.
//

import SwiftUI

struct ProjectsView: View {
    
    @ObservedObject var viewModel = ProjectViewModel()
    @ObservedObject var timerManager = TimerManager()
    
    @State var projectname = ""
    
    var body: some View {
        NavigationView {
            VStack {
                /*
                 Section {
                 TextField("create new project...", text: $projectname)
                 .padding()
                 .multilineTextAlignment(.center)
                 .frame(width: 350, height: 50, alignment: .center)
                 
                 Button {
                 viewModel.addProject(projectname: projectname)
                 projectname = ""
                 } label: {
                 Text("add project")
                 .frame(width: 130, height: 35, alignment: .center)
                 .background(.blue)
                 .foregroundColor(.white)
                 .cornerRadius(8)
                 }
                 }
                 */
                
                List {
                    ForEach (viewModel.projects, id: \.id) { project in
                        
                        HStack {
                            Label {
                                Text(project.projectName)
                                    .font(.title)
                            } icon: {
                                //Image
                                project.symbol
                            }
                            
                            Spacer()
                            VStack {
                                Image(systemName: project.isRecording ? "stop.circle.fill" : "play.circle.fill")
                                    .foregroundColor(project.isRecording ? .red : .green)
                                    .frame(width: 40, height: 40, alignment: .center)
                                    .onTapGesture {
                                        viewModel.toggleRecording(id: project.id)
                                        if (project.isRecording == true) {
                                            timerManager.timerStart()
                                        }
                                    }
                                if (project.isRecording == true) {
                                    Text(String(format: "%02d:%02d:%02d", timerManager.hours, timerManager.minutes, timerManager.seconds))
                                    .foregroundColor(.gray)
                                }
                            }
                            .padding(.trailing, 10)
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
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        addProjectAlert()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        viewModel.deleteProject(at: offsets)
    }
    
    func addProjectAlert() {
        let alert = UIAlertController(title: "Project", message: "add new project", preferredStyle: .alert)
        
        alert.addTextField() { (projectname) in
            projectname.placeholder = "projectname"
        }
        let add = UIAlertAction(title: "Add", style: .default) { (_) in
            projectname = alert.textFields![0].text!
            viewModel.addProject(projectname: projectname)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive) { (_) in
            
        }
        
        alert.addAction(add)
        alert.addAction(cancel)
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: {})
    }
    
    
}



struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsView()
    }
}
