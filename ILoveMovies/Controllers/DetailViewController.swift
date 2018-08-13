//
//  DetailViewController.swift
//  ILoveMovies
//
//  Created by Developer on 13/08/18.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    var movie: MovieView!
    var service: MovieService!
    var movieDetailIdentifier: Int!
    @IBOutlet weak var bluredImageView: UIImageView!
    @IBOutlet weak var detailTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailTableView.delegate = self
        self.detailTableView.dataSource = self
        self.service = MovieService(delegate: self)
        self.view.backgroundColor = UIColor .secundaryColor
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.service.getMovie(identifier: movieDetailIdentifier)
        self.movie = MovieViewModel.get(identifier: movieDetailIdentifier)
        self.configureTableView()
    }
    func configureTableView() {
        self.detailTableView.register(UINib(nibName: "HeaderTableViewCell",
                                            bundle: nil), forCellReuseIdentifier: "headerCell")
        //let urlBluredImage = URL(string: baseImageURL + "original" + movie.backdropPath)
        //let urlPosterImage = URL(string: baseImageURL + "original" + movie.posterPath)
        //self.bluredImageView.kf.indicatorType = .activity
        //self.bluredImageView.kf.setImage(with: urlBluredImage, options: [.transition(.fade(1.0))])
        //self.moviePosterImageView.kf.indicatorType = .activity
        //self.moviePosterImageView.kf.setImage(with: urlPosterImage, options: [.transition(.fade(1.0))])
    }
}

extension DetailViewController: MovieServiceDelegate {
    func searchMoviesSuccess() {
        //
    }
    func searchMoviesFailure(error: String) {
        //
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath)
        return cell
    }
}
