//
//  OverviewTableViewCell.swift
//  ILoveMovies
//
//  Created by Developer on 14/08/18.
//

import UIKit

class OverviewTableViewCell: UITableViewCell {
    @IBOutlet weak var favotiteButton: UIButton!
    @IBOutlet weak var titleTextField: UILabel!
    @IBOutlet weak var overviewTextField: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func bind(movie: MovieView) {
        self.titleTextField.text = movie.title
        self.overviewTextField.text = movie.overview
    }
}
