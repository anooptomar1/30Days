//
//  Day12ViewController.swift
//  30DaysOfiOS12
//
//  Created by DevTechie Interactive on 9/26/18.
//  Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit

class Day12ViewController: UIViewController {
    
    var data = ["Egg", "Milk", "Bread"]
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.title = "Add New Item"
        // add button
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addNewItem(_:)))
    }
    
    @objc func addNewItem(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: Day12AddViewController.identifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Day12AddViewController.identifier {
            let vc = segue.destination as! Day12AddViewController
            vc.delegate = self
        }
    }
}

extension Day12ViewController: Day12AddViewControllerDelegate {
    func didAddNewItem(controller: Day12AddViewController, item: String) {
        self.data.append(item)
        self.tableView.reloadData()
    }
}

extension Day12ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = data[indexPath.row]
        return cell!
    }
}
