//
//  SecondViewController.swift
//  Duality
//
//  Created by rishi on 10/30/18.
//  Copyright © 2018 Rishi Thakkar. All rights reserved.
//

import UIKit

class SecondViewController: UITableViewController {
    private var taskList = Task.getMockData()

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        if (indexPath.row < taskList.count) {
            let item = taskList[indexPath.row]
            cell.textLabel?.text = item.Name
            
            let accesory: UITableViewCellAccessoryType = item.isDone ? .checkmark : .none
            cell.accessoryType = accesory
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row < taskList.count
        {
            let item = taskList[indexPath.row]
            item.isDone = !item.isDone
            
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.row < taskList.count
        {
            taskList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Task List"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

