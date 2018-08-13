//
//  MovieCollectionViewCell.swift
//  ILoveMovies
//
//  Created by Developer on 11/08/18.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor .primaryColor
        // Initialization code
    }
    func bind(movie: MovieView) {
        let url = URL(string: baseImageURL + "original" + movie.posterPath)
        imageView.kf.setImage(with: url)
    }
}
