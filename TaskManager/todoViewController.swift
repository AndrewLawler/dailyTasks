//
//  todoViewController.swift
//  TaskManager
//
//  Created by Andrew Lawler on 17/10/2019.
//  Copyright © 2019 andrewlawler. All rights reserved.
//

import UIKit

class YourCell: UITableViewCell {
    @IBOutlet weak var cell: UIView!
}

class todoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var taskAmount: UILabel!
    
    var daysTasks = [String]()
    var selectedDay = ""
    var currentCell = -1

    @IBAction func goBtn(_ sender: Any) {
        let text = inputText.text
        daysTasks.append(text!)
        taskAmount.text = String(daysTasks.count)
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt
    indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            daysTasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daysTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "myCell2")
        cell.textLabel?.text = daysTasks[indexPath.row]
        return cell
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.text = selectedDay
        // Do any additional setup after loading the view.
    }
    
}

