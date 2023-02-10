//
//  AddTaskView.swift
//  myToDO
//
//  Created by Ikshit Chaudhari on 10/02/23.
//

import SwiftUI

struct AddTaskView: View {
    
    @State private var taskTitle: String = ""
    @Environment (\.dismiss) var closeSheet
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20){
            Text("Create new task")
                .font(.title)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Enter your tasks here...", text: $taskTitle)
                .textFieldStyle(.roundedBorder)
            
            Button {
                if taskTitle != "" {
                    print("task added")
                }
                closeSheet()
            } label: {
                Text("Add Task")
                    .font(.title3)
                    .fontWeight(.medium)
                    .padding()
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .background(Color(hue: 0.522, saturation: 0.287, brightness: 0.565))
                    .cornerRadius(20)
            }

            
            Spacer()
        }
        .padding()
        .background(Color(hue: 0.522, saturation: 0.171, brightness: 0.858))
        
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
