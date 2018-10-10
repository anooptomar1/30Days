//
//  Day17ViewController.swift
//  30DaysOfiOS12
//
//  Created by DevTechie Interactive on 9/28/18.
//  Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit

class Day17ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var data = Day17Model.populateMovies()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movie Parsing"
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

}

extension Day17ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].name
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let movie = data[indexPath.section].movies[indexPath.row]
        cell?.textLabel?.text = movie.movieTitle!
        cell?.detailTextLabel?.text = movie.movieCast!
        return cell!
    }
}


