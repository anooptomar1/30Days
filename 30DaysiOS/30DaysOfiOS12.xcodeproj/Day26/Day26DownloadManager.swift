//
// Day26DownloadManager
// 30DaysOfiOS12
//
// Created by DevTechie Interactive on 10/5/18.
// Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit
class Day26DownloadManager {
    // get api key from here -> themoviedb.org
    func getPopularMovies(completionHandler: @escaping ([MovieData]?)-> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=2a61185ef6a27f400fd92820ad9e8537&language=en-US&page=1")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                completionHandler(nil)
                return
            }
            
            do {
                let jsonData = try JSONDecoder().decode(Envelope.self, from: data)
                completionHandler(jsonData.results)
            } catch {
                completionHandler(nil)
                print(error.localizedDescription)
            }
        }.resume()
    }
}

class MovieData: Codable {
    var title: String?
    var overview: String?
    var poster_path: String?
}

class Envelope: Codable {
    var page: Int?
    var total_results: Int?
    var total_pages: Int?
    var results: [MovieData]?
}
