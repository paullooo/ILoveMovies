//
//  HeaderTableViewCell.swift
//  ILoveMovies
//
//  Created by Developer on 13/08/18.
//

import UIKit
import Kingfisher

class HeaderTableViewCell: UITableViewCell {
    @IBOutlet weak var blurImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func bind(movie: MovieView) {
        let urlBackdrop = URL(string: baseImageURL + "original" + movie.backdropPath)
        let urlPoster = URL(string: baseImageURL + "original" + movie.posterPath)
        self.blurImageView.setImageBlur(url: urlBackdrop)
        self.posterImageView.kf.setImage(with: urlPoster, options: [.transition(.fade(1.0))])
    }
}
