//
//  MovieTableViewCell.swift
//  Yassir-Movies
//
//  Created by Yahia El-Dow on 24/04/2023.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet private weak var moviePoster: UIImageView! {
        didSet {
            moviePoster.image = nil
        }
    }
    @IBOutlet private weak var movieNameLabel: UILabel! {
        didSet {
            self.movieNameLabel.text = ""
        }
    }
    @IBOutlet private weak var movieSubtitleLabel: UILabel!{
        didSet {
            self.movieSubtitleLabel.text = ""
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(movie: MovieDetails) {
        self.movieNameLabel.text = movie.originalTitle ?? ""
        self.movieSubtitleLabel.text = movie.releaseDate
        if let posterPath = movie.posterPath {
            self.moviePoster.loadImageFromUrl(imgUrl: "\(Environment.imagePath)\(posterPath)")
        }
    }
    
}
