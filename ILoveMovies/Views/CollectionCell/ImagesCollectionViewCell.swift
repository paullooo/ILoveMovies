//
//  ImagesCollectionViewCell.swift
//  ILoveMovies
//
//  Created by Developer on 16/08/18.
//

import UIKit
import Kingfisher

class ImagesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var backdropImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bind(backdrop: String) {
        //mandar isso para o viewmodel
        let url = URL(string: baseImageURL + "original" + backdrop)
        self.backdropImageView.kf.indicatorType = .activity
        self.backdropImageView.kf.setImage(with: url, options: [.transition(.fade(1.0))])
    }
}
