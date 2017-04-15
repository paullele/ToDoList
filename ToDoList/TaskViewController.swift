//
//  FirstViewController.swift
//  ToDoList
//
//  Created by apple on 14/04/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableTask: UITableView!
    
    @IBAction func unwindToTasks(sender: UIStoryboardSegue) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableTask.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItem" {
            if let controller = (segue.destination as! UINavigationController).topViewController as?  AddTaskViewController {
                controller.task = sender as? String
            }
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: UITableViewRowActionStyle.destructive, title: "Delete", handler: {action in
            taskManager.taskArray.remove(at: indexPath.row)
            self.tableTask.reloadData()
        })
        
        let edit = UITableViewRowAction(style: UITableViewRowActionStyle.normal, title: "Edit", handler: {action in
            let cell = taskManager.taskArray[indexPath.row]
            self.performSegue(withIdentifier: "AddItem", sender: cell)
        })
        
        edit.backgroundColor = UIColor.green
        
        return [delete, edit]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskManager.taskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = taskManager.taskArray[indexPath.row]
        return cell
    }

}

