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
    @IBOutlet weak var bluredImageView: UIImageView!
    @IBOutlet weak var detailTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailTableView.delegate = self
        self.detailTableView.dataSource = self
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
        self.detailTableView.backgroundColor = UIColor .secundaryColor
    }
    @objc
    func likeMovie() {
        MovieViewModel.makeFavorite(identifier: self.movie.identifier)
    }
}

extension DetailViewController: MovieServiceDelegate {
    func getMovieSuccess() {
        self.movie = MovieViewModel.get(identifier: self.movie.identifier)
        self.detailTableView.reloadData()
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
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell",
                                                     for: indexPath) as? HeaderTableViewCell
            cell?.bind(movie: self.movie)
            return cell ?? HeaderTableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "overviewCell",
                                                 for: indexPath) as? OverviewTableViewCell
        cell?.bind(movie: self.movie)
        return cell ?? OverviewTableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return CGFloat.init(200)
        }
        return CGFloat.init(200)
    }
}
