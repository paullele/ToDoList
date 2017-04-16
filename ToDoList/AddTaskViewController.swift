//
//  SecondViewController.swift
//  ToDoList
//
//  Created by apple on 14/04/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController, UITextFieldDelegate {

    var task: String?
    var index: Int?
    var onEdit: Bool?
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var taskControllerButon: UIBarButtonItem!
    
    @IBAction func addTask(_ sender: UIBarButtonItem) {
        let task = textField.text ?? ""
        if(!onEdit!) {
            taskManager.taskArray.append(task)
        } else {
            taskManager.taskArray[index!] = task
        }
        textField.text = ""
        self.performSegue(withIdentifier: "unwindToTasks", sender: self)
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "unwindToTasks", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if(onEdit!) {
            taskControllerButon.title = "Update"
        }
        textField.text = task ?? ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

