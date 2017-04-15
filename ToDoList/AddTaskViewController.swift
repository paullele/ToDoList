//
//  SecondViewController.swift
//  ToDoList
//
//  Created by apple on 14/04/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import os.log

class AddTaskViewController: UIViewController, UITextFieldDelegate {

    var task: String?
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addTask(_ sender: UIBarButtonItem) {
        let task = textField.text ?? ""
        taskManager.taskArray.append(task)
        textField.text = ""
        self.performSegue(withIdentifier: "unwindToTasks", sender: self)
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "unwindToTasks", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

