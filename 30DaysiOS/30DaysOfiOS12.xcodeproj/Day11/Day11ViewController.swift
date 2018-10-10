//
//  Day11ViewController.swift
//  30DaysOfiOS12
//
//  Created by DevTechie Interactive on 9/26/18.
//  Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit

class Day11ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var data = ["Milk", "Apples", "Eggs", "Chicken", "Salt"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Moving and Deleting"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // edit button
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    // editing
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: animated)
    }
    
    // moving
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let rowToMove = data[sourceIndexPath.row]
        data.remove(at: sourceIndexPath.row)
        data.insert(rowToMove, at: destinationIndexPath.row)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = data[indexPath.row]
        return cell!
    }

}
