//
//  AddViewController.swift
//  TaskSiri
//
//  Created by ymgn on 2019/08/26.
//  Copyright © 2019 ymgn. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet weak var taskNameField: UITextField!
    @IBOutlet weak var addTaskButton: UIButton!
    
    let taskCtrl = TaskController()
    
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
        self.taskCtrl.add(newTask: newTask)
        
        dismiss(animated: true)
    }
}
