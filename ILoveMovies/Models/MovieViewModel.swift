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
}

class MovieViewModel {
    static func save(movies: [Movie]) {
        try! realm.write {
            realm.add(movies, update: true)
        }
    }
    static func clear() {
        try! realm.write {
            realm.delete(realm.objects(Movie.self))
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

    static func makeFavorite(identifier: Int) {
        if let movie = self.getModel(identifier: identifier) {
            try! realm.write {
                movie.favorite = true
            }
        }
    }
    static func removeFavorite(identifier: Int) {
        if let movie = self.getModel(identifier: identifier) {
            try! realm.write {
                movie.favorite = false
            }
        }
    }
    static func get(identifier: Int) -> MovieView {
        return self.getAsView(movie: realm.object(ofType: Movie.self, forPrimaryKey: identifier))
    }
    static func getModel(identifier: Int) -> Movie? {
        return realm.object(ofType: Movie.self, forPrimaryKey: identifier)
    }
    static func getMovies() -> [MovieView] {
        let moviesModel = realm.objects(Movie.self)
        var movies: [Movie] = []
        movies.append(contentsOf: moviesModel)
        return self.getAsView(sequence: movies)
    }
}
