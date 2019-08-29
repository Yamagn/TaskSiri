//
//  DetailViewController.swift
//  TaskSiri
//
//  Created by ymgn on 2019/08/26.
//  Copyright © 2019 ymgn. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var task: Task?
    let taskCtrl = TaskController()
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let task = task {
            taskNameLabel.text = task.name
        }
        deleteButton.layer.cornerRadius = 8
        // Do any additional setup after loading the view.
    }
    
    @IBAction func deleteTask(_ sender: Any) {
        if let task = task {
            taskCtrl.delete(task: task)
        }
        self.navigationController?.popViewController(animated: true)
    }
}
