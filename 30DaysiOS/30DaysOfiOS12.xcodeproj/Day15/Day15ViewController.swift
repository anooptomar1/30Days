//
//  Day15ViewController.swift
//  30DaysOfiOS12
//
//  Created by DevTechie Interactive on 9/27/18.
//  Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit

class Day15ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var data = [Day15DataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.title = "My Contacts"
        data = Day15DataModel.parseData()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! Day15TableViewCell
        let obj = data[indexPath.row]
        cell.nameLabel.text = obj.name!
        cell.addressLabel.text = obj.address!
        cell.img.image = UIImage(named: "image\(arc4random_uniform(27))")
        cell.img.layer.borderColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        cell.img.layer.borderWidth = 5
        cell.img.layer.cornerRadius = 30
        cell.img.layer.masksToBounds = true
        return cell
    }
}

class Day15TableViewCell: UITableViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
}
