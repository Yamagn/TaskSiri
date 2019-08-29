//
//  TaskController.swift
//  TaskSiri
//
//  Created by ymgn on 2019/08/30.
//  Copyright © 2019 ymgn. All rights reserved.
//

import Foundation
import RealmSwift

class TaskController {
    let realm = try! Realm()
    func add(newTask: Task) {
        try! realm.write {
            realm.add(newTask)
        }
    }
    
    func delete(task: Task) {
        try! realm.write {
            realm.delete(task)
        }
    }
    
    func showByName(name: String) -> Task? {
        return realm.objects(Task.self).filter{ task in task.name == name}.first
    }
    
    func getAll() -> Results<Task> {
        return realm.objects(Task.self)
    }
}
