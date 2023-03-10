//
//  ContentView.swift
//  myToDO
//
//  Created by Ikshit Chaudhari on 10/02/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showTaskAddView: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            
            TaskView()
            
            AddTaskButton()
                .padding()
                .onTapGesture {
                    showTaskAddView.toggle()
                }
        }
        .sheet(isPresented: $showTaskAddView){
            AddTaskView()
        }
        .background(Color(hue: 0.522, saturation: 0.171, brightness: 0.858))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
