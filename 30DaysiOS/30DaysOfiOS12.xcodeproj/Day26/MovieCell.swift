//
// MovieCell
// 30DaysOfiOS12
//
// Created by DevTechie Interactive on 10/5/18.
// Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    var movie: MovieData? {
        didSet {
            if let movie = movie {
                UIImage.imageAsync(urlString: "https://image.tmdb.org/t/p/w500/\(movie.poster_path!)") { (image) in
                    DispatchQueue.main.async {
                        self.imageV.image = image
                    }
                }
                movieTitle.text = movie.title!
                movieDesc.text = movie.overview!
            }
        }
    }
    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDesc: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
