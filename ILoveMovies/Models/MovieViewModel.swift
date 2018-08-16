//
//  MovieViewModel.swift
//  ILoveMovies
//
//  Created by Developer on 11/08/18.
//
import Foundation

struct MovieView {
    var identifier: Int = -1
    var title: String = ""
    var originalTitle: String = ""
    var releaseDate: String = ""
    var overview: String = ""
    var posterPath: String = ""
    var backdropPath: String = ""
    var isFavorite: Bool = false
    var backdrops: [String] = []
}

class MovieViewModel {
    static func save(movies: Movie) {
        let movie = realm.object(ofType: Movie.self, forPrimaryKey: movies.identifier)
        movies.favorite = movie?.favorite ?? false
        try! realm.write {
            realm.add(movies, update: true)
        }
    }
    static func clear() {
        try! realm.write {
            realm.delete(realm.objects(Movie.self).filter({ !$0.favorite }))
        }
    }
    static func getAsView(movie: Movie?) -> MovieView {
        guard let movie = movie else {
            return MovieView()
        }
        var movieView = MovieView()
        if let identifier = movie.identifier.value {
            movieView.identifier = identifier
            movieView.title = movie.title ?? ""
            movieView.posterPath = movie.posterPath ?? ""
            movieView.originalTitle = movie.originalTitle ?? ""
            movieView.overview = movie.overview ?? ""
            movieView.backdropPath = movie.backdropPath ?? ""
            movieView.isFavorite = movie.favorite
            movie.backdrops.forEach({ movieView.backdrops.append($0) })
        }
        return movieView
    }
    static func getAsView(sequence: [Movie]) -> [MovieView] {
        var movies: [MovieView] = []
        for movie in sequence {
            movies.append(self.getAsView(movie: movie))
        }
        return movies
    }

    static func makeFavorite(identifier: Int, favorite: Bool) -> MovieView {
        if let movie = self.getModel(identifier: identifier) {
            try! realm.write {
                movie.favorite = favorite
            }
            return self.getAsView(movie: movie)
        }
        return MovieView()
    }
    static func saveImages(identifier: Int, backdrops: [Backdrop]) {
        if let movie = self.getModel(identifier: identifier) {
          try! realm.write {
            backdrops.forEach({ movie.backdrops.append($0.filePath) })
          }
        }
    }
    static func get(identifier: Int) -> MovieView {
        return self.getAsView(movie: realm.object(ofType: Movie.self, forPrimaryKey: identifier))
    }
    static func getModel(identifier: Int) -> Movie? {
        return realm.object(ofType: Movie.self, forPrimaryKey: identifier)
    }
    static func getMovies(favorite: Bool = false) -> [MovieView] {
        let moviesModel = realm.objects(Movie.self)
        var movies: [Movie] = []
        movies.append(contentsOf: moviesModel)
        return self.getAsView(sequence: movies.filter({ $0.favorite == favorite }))
    }
}
