//
//  DetailViewController.swift
//  ILoveMovies
//
//  Created by Developer on 13/08/18.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    var movie: MovieView! {
        didSet {
            self.likeButtonChangeState(state: self.movie.isFavorite)
        }
    }
    var service: MovieService!
    @IBOutlet weak var bluredImageView: UIImageView!
    @IBOutlet weak var detailTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailTableView.delegate = self
        self.detailTableView.dataSource = self
        self.detailTableView.rowHeight = UITableViewAutomaticDimension
        self.detailTableView.estimatedRowHeight = 300
        self.service = MovieService(delegate: self)
        self.view.backgroundColor = UIColor .secundaryColor
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Like",
                                                                 style: .done,
                                                                 target: self,
                                                                 action: #selector(likeMovie))
        self.configureTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.service.getMovie(identifier: self.movie.identifier)
    }
    func configureTableView() {
        self.detailTableView.register(UINib(nibName: "HeaderTableViewCell",
                                            bundle: nil), forCellReuseIdentifier: "headerCell")
        self.detailTableView.register(UINib(nibName: "OverviewTableViewCell",
                                            bundle: nil), forCellReuseIdentifier: "overviewCell")
        self.detailTableView.register(UINib(nibName: "ImagesTableViewCell",
                                            bundle: nil), forCellReuseIdentifier: "imagesCell")
        self.detailTableView.backgroundColor = UIColor .secundaryColor
    }
    @objc
    func likeMovie() {
        self.movie = MovieViewModel.makeFavorite(identifier: self.movie.identifier, favorite: !self.movie.isFavorite)
    }
    func likeButtonChangeState(state: Bool) {
        self.navigationItem.rightBarButtonItem?.title = state ? "Dislike" : "Like"
    }
}

extension DetailViewController: MovieServiceDelegate {
    func getImageSuccess() {
        self.movie = MovieViewModel.get(identifier: self.movie.identifier)
        self.detailTableView.reloadData()
    }
    func getImageFailure() {
    }
    func getMovieSuccess() {
        self.movie = MovieViewModel.get(identifier: self.movie.identifier)
    }
    func getMovieFailure() {
    }
    func searchMoviesSuccess(movies: [Movie]) {
    }
    func searchMoviesFailure() {
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell",
                                                     for: indexPath) as? HeaderTableViewCell
            cell?.bind(movie: self.movie)
            return cell ?? HeaderTableViewCell()
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "overviewCell",
                                                     for: indexPath) as? OverviewTableViewCell
            cell?.bind(movie: self.movie)
            return cell ?? OverviewTableViewCell()
        }
            let cell = tableView.dequeueReusableCell(withIdentifier: "imagesCell",
                                                     for: indexPath) as? ImagesTableViewCell
            cell?.bind(movie: self.movie)
            return cell ?? ImagesTableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return CGFloat.init(200)
        }
        return self.detailTableView.rowHeight
    }
}
