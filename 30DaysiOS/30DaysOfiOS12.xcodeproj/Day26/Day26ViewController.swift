//
// Day26ViewController
// 30DaysOfiOS12
//
// Created by DevTechie Interactive on 10/5/18.
// Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit

class Day26ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var movies = [MovieData]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.title = "Movies + Networking"
        Day26DownloadManager().getPopularMovies { (movies) in
            if let movies = movies {
                self.movies = movies
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MovieCell
        cell.movie = movies[indexPath.row]
        return cell
    }

}
