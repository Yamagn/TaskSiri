//
//  HomeViewController.swift
//  TaskSiri
//
//  Created by ymgn on 2019/08/26.
//  Copyright © 2019 ymgn. All rights reserved.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let userDefaults = UserDefaults.standard
    var tasks: [Task] = []
    
    var selectedTask: Task?
    
    let realm = try! Realm()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let taskArray = realm.objects(Task.self)
        if taskArray.count != 0{
            tasks = []
            tasks += taskArray
            self.tableView.reloadData()
        } else {
            tasks = []
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let detailView = segue.destination as! DetailViewController
            if let task = self.selectedTask {
                detailView.task = task
            }
        }
    }
    
    @IBAction func addTask(_ sender: Any) {
        performSegue(withIdentifier: "showAdd", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        cell.taskName.text = task.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedTask = tasks[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: false)
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
}
