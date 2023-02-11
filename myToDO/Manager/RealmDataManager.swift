//
//  RealmDataManager.swift
//  myToDO
//
//  Created by Ikshit Chaudhari on 11/02/23.
//

import Foundation
import RealmSwift

class RealmDatamanager: ObservableObject {
    
    private(set) var localRealm: Realm?
    @Published private(set) var tasks: [Task] = []   // here "Task" is task Models -> Task
    
    init(){
        openRealm()
        getTask()
    }
    
//    MARK: - START Open realm function
    func openRealm() {
        
        do{
            
            let realmConfig = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = realmConfig
            localRealm = try Realm()
            
        } catch{
            print("Error opening realm: \(error.localizedDescription)")
        }
        
    } // MARK: - END Open Realm Function
    
    
    
//    MARK: - START Add task function
    
    func addTask(taskTitle: String) {
        if let localRealm = localRealm {
            
            do{
                try localRealm.write{
                    let newTask = Task(value: ["taskTitle": taskTitle, "completedStatus": false])
                    localRealm.add(newTask)
                    getTask()
                    print("new task added \(newTask)")
                }
            } catch{
                print("Error adding task: \(error.localizedDescription)")
            }
            
        }
    } // MARK: - END Add task function
    
    
    
//    MARK: - START Get task function
    
    func getTask(){
        
        if let localRealm = localRealm{
        
            let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completedStatus")
            tasks = []
            
            allTasks.forEach{ task in
                tasks.append(task) // here "tasks" is tasks: [Task]
            }
            
        }
        
    } // MARK: - END Get task function

    
    
//    MARK: - START Update task function
    
    func updateTask(id: ObjectId, completed: Bool) {
           if let localRealm = localRealm{
               do{
                   let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                   guard !taskToUpdate.isEmpty else { return }
                   
                   try localRealm.write{
                       taskToUpdate[0].completedStatus = completed
                       getTask()
                       print("task updated with id: \(id)! completed status: \(completed)")
                   }
                   
               } catch{
                   print("Error update task \(id) to realm : \(error)")
               }
           }
       } // MARK: - END Update task function

    
    
//    MARK: - START Update task function
    
    func deleteTask(id: ObjectId){
            
            if let localRealm = localRealm{
                do {
                    
                    let taskToDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                    guard !taskToDelete.isEmpty else { return }
                    
                    try localRealm.write{
                        localRealm.delete(taskToDelete)
                        getTask()
                        print("Deleted task with id: \(id)")
                    }
                    
                } catch {
                    print("Error Deleting Task: \(id) ERROR: \(error)")
                }
            }
        }
}
