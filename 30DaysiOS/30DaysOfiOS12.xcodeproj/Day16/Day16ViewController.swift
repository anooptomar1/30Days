//
//  Day16ViewController.swift
//  30DaysOfiOS12
//
//  Created by DevTechie Interactive on 9/28/18.
//  Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit

class Day16ViewController: UIViewController {

    var cars = ["Audi", "Aston Martin","BMW", "Bugatti", "Bentley","Chevrolet", "Cadillac","Dodge","Ferrari", "Ford","Honda","Jaguar","Lamborghini","Mercedes", "Mazda","Nissan","Porsche","Rolls Royce","Toyota","Volkswagen"]
    
    @IBOutlet weak var tableView: UITableView!
    
    var carModel = [String: [String]]()
    var sectionTitle = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.title = "TableView Indexed"
        self.populateData()
    }
    
    func populateData() {
        for car in cars {
            let currentCarKey = String(car.prefix(1))
            if var values = carModel[currentCarKey] {
                values.append(car)
                carModel[currentCarKey] = values
            } else {
                carModel[currentCarKey] = [car]
            }
        }
        sectionTitle = [String](carModel.keys)
        sectionTitle = sectionTitle.sorted(by: {$0 < $1})
    }

}

extension Day16ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = sectionTitle[section]
        if let values = carModel[key] {
            return values.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let key = sectionTitle[indexPath.section]
        if let values = carModel[key] {
            cell?.textLabel?.text = values[indexPath.row]
        }
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitle
    }
}
