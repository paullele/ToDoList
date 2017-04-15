//
//  TaskManager.swift
//  ToDoList
//
//  Created by apple on 14/04/2017.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

var taskManager = TaskManager()

class TaskManager: NSObject {
    var taskArray = [String]()
    func addTask(name: String) {
        taskArray.append(name)
    }
}
