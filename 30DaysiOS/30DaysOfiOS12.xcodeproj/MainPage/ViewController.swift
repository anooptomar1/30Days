//
//  ViewController.swift
//  30DaysOfiOS12
//
//  Created by DevTechie Interactive on 9/19/18.
//  Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var dataModel = NavModel.getDays()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // hide back button text
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    }
    
    
    // MARK: uitableview delegate and datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ContentTableViewCell
        cell.data = dataModel[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dayCount = dataModel[indexPath.row].dayCount
        let initViewController = UIStoryboard(name: "Day\(dayCount)", bundle: nil).instantiateInitialViewController()
        self.navigationController?.pushViewController(initViewController!, animated: true)
    }
}


