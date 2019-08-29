//
//  DetailViewController.swift
//  TaskSiri
//
//  Created by ymgn on 2019/08/26.
//  Copyright © 2019 ymgn. All rights reserved.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {
    let realm = try! Realm()
    var task: Task?
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
        try! realm.write {
            if let task = self.task {
                realm.delete(task)
            }
        }
        self.navigationController?.popViewController(animated: true)
    }
}
