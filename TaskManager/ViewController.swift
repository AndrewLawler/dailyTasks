//
//  ViewController.swift
//  TaskManager
//
//  Created by Andrew Lawler on 17/10/2019.
//  Copyright © 2019 andrewlawler. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedDay = ""
    var currentCell = -1
    
    var days = [String]()
    var dayCount = 0
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "myCell")
        cell.textLabel?.text = days[indexPath.row]
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           currentCell = indexPath.row
           selectedDay = days[currentCell]
           performSegue(withIdentifier: "toDetailView", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt
    indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            days.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            tableView.reloadData()
        }
    }
    
    @IBAction func goBtn(_ sender: Any) {
        tableView!.isHidden = false
        dayCount += 1
        days.append("\(dayCount)")
        tableView!.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "toTodoView" {
               let secondViewController = segue.destination as! todoViewController
               secondViewController.selectedDay = days[currentCell]
           }
    }


}

