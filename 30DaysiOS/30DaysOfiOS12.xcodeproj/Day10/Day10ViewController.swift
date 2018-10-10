//
//  Day10ViewController.swift
//  30DaysOfiOS12
//
//  Created by DevTechie Interactive on 9/20/18.
//  Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit

class Day10ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = ["Milk", "Apples", "Eggs", "Chicken", "Salt"]
    
    // refresh control
    private let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TableView + Refresh Control"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.refreshControl = refreshControl
        self.refreshControl.addTarget(self, action: #selector(addMoreData(_:)), for: UIControl.Event.valueChanged)
        self.refreshControl.tintColor = #colorLiteral(red: 0.968627451, green: 0.3803921569, blue: 0.3882352941, alpha: 1)
        self.refreshControl.attributedTitle = NSAttributedString(string: "Fetching new data...")
    }
    
    @objc func addMoreData(_ sender: UIRefreshControl) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.data.append(contentsOf: ["Pears", "Blueberries", "Peaches", "Onions"])
            self.refreshControl.endRefreshing()
            self.tableView.reloadData()
        }
    }
}

extension Day10ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = data[indexPath.row]
        return cell!
    }
}
