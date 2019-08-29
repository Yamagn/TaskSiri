//
//  AddViewController.swift
//  TaskSiri
//
//  Created by ymgn on 2019/08/26.
//  Copyright © 2019 ymgn. All rights reserved.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController {
    @IBOutlet weak var taskNameField: UITextField!
    @IBOutlet weak var addTaskButton: UIButton!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTaskButton.layer.cornerRadius = 8

        // Do any additional setup after loading the view.
    }
    @IBAction func closeModal(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func addTask(_ sender: Any) {
        guard let taskName = taskNameField.text else { return }
        print(taskName)
        let newTask = Task()
        newTask.name = taskName
        
        try! realm.write {
            self.realm.add(newTask)
        }
        
        dismiss(animated: true)
    }
}
