//
//  AddTaskButton.swift
//  myToDO
//
//  Created by Ikshit Chaudhari on 10/02/23.
//

import SwiftUI

struct AddTaskButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 60)
            
            Text("+")
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.semibold)
                .offset(y:-1.5)
        }
        .frame(height: 50)
    }
}

struct AddTaskButton_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskButton()
    }
}
