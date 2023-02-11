//
//  Task.swift
//  myToDO
//
//  Created by Ikshit Chaudhari on 11/02/23.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var taskTitle: String = ""
    @Persisted var completedStatus: Bool = false
    
}
