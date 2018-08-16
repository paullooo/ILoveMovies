//
//  SearchViewController.swift
//  ILoveMovies
//
//  Created by Developer on 11/08/18.
//

import UIKit

class SearchViewController: UIViewController {
    var movies: [MovieView] = []
    var service: MovieService!
    var randomString: RandomString!
    var alertView: AlertView!
    @IBOutlet weak var movieCollection: UICollectionView!
    var searchController: UISearchController!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.service = MovieService(delegate: self)
        self.title = "Search"
        self.randomString = RandomString()
        self.alertView = AlertView()
        self.view.backgroundColor = UIColor .secundaryColor
        self.configureSearchBar()
        self.configureCollection()
        self.navigationItem.searchController = searchController
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationItem.hidesSearchBarWhenScrolling = true
    }
    func configureSearchBar() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Buscar Filme"
        searchController.searchBar.tintColor = .white
        searchController.searchBar.barStyle = .black
    }
    func configureCollection() {
        self.movieCollection.dataSource = self
        self.movieCollection.delegate = self
        self.movieCollection.backgroundColor = UIColor .secundaryColor
        self.movieCollection.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil),
                                      forCellWithReuseIdentifier: "movieItem")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if self.isMovingToParentViewController {
            searchController.isActive = true
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let controller = segue.destination as? DetailViewController {
                controller.movie = sender as? MovieView
            }
        }
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.searchController.searchBar.resignFirstResponder()
    }
}

extension SearchViewController: MovieServiceDelegate {
    func getMovieSuccess() {
        
    }
    
    func getMovieFailure() {
        
    }
    func searchMoviesSuccess(movies: [Movie]) {
        self.movies = MovieViewModel.getAsView(sequence: movies)
        self.movieCollection.reloadData()
    }
    func searchMoviesFailure() {
         self.alertView.failMessage(message: "Não foi possivel realizar sua busca!")
    }
}

extension SearchViewController: UICollectionViewDelegate,
UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.movies.isEmpty {
            collectionView.setEmptyMessage(self.randomString.randomSearchString())
        } else {
            collectionView.removeEmptyMessage()
        }
        return self.movies.count
    }
    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieItem",
                                                      for: indexPath) as? MovieCollectionViewCell
        if !self.movies.isEmpty {
        cell?.bind(movie: self.movies[indexPath.row])
        }
        return cell ?? MovieCollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.searchController.searchBar.becomeFirstResponder()
        self.searchController.isActive = false
        performSegue(withIdentifier: "detailSegue", sender: self.movies[indexPath.row])
    }
}

extension SearchViewController: UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.dismiss(animated: true, completion: nil)
    }
    func updateSearchResults(for searchController: UISearchController) {
        let searchString = searchController.searchBar.text
        self.service.getMovies(search: searchString ?? "")
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.service.getMovies(search: searchText)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.text = nil
        self.dismiss(animated: true, completion: nil)
    }
    func presentSearchController(_ searchController: UISearchController) {
        self.searchController.searchBar.becomeFirstResponder()
    }
}
