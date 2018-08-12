//
//  MovieService.swift
//  ILoveMovies
//
//  Created by Developer on 11/08/18.
//
import Alamofire
import AlamofireObjectMapper

class MovieService {
    var getMoviesRequest: DataRequest?
    var getSimilarMovie: DataRequest?
    var getMovieRequest: DataRequest?
    var getVideosRequest: DataRequest?
    var getSimilarMoviesRequest: DataRequest?
    func getMovies(search string: String) {
        self.getMoviesRequest?.cancel()
        self.getMoviesRequest = RequestFactory.getMovieSearch(with: string).validate().responseArray(
            keyPath: "results", completionHandler: { (response: DataResponse<[Movie]>) in
            switch response.result {
            case .success:
                if let movies = response.result.value {
                    MovieViewModel.clear()
                    MovieViewModel.save(movies: movies)
                }
                //self.delegate.success(.movies)
            case .failure:
                  print("Fail")
//                let isRequestCancel = ErrorManager.getStatusCode(response) == -999
//                self.delegate.failure(.movies, error: isRequestCancel ? nil : ErrorManager.get(response))
            }
            })
    }
    func getSimilarMovie(identifier: Int) {
        self.getSimilarMoviesRequest?.cancel()
        self.getSimilarMoviesRequest = RequestFactory.getSimilarMovie(identifier: identifier).validate().responseArray(
            keyPath: "results", completionHandler: { (response: DataResponse<[Movie]>) in
            switch response.result {
            case .success:
                if let moviesSimilar = response.result.value {
                     MovieViewModel.clear()
                     MovieViewModel.save(movies: moviesSimilar)
                }
                //self.delegate.success(.similar)
            case .failure:
                print("FAIL")
                //self.delegate.failure(.similar, error: ErrorManager.get(response))
            }
            })
    }
    func getMovie(identifier: Int) {
        self.getMovieRequest?.cancel()
        self.getMovieRequest = RequestFactory.getMovie(identifier: identifier).validate().responseObject(
            completionHandler: { (response: DataResponse<Movie>) in
            switch response.result {
            case .success:
                if let movie = response.result.value {
                    //MovieViewModel.save(movie: movie, type: .normal)
                }
                //self.delegate.success(.movie)
            case .failure:
                print("FAIL")
                //self.delegate.failure(.movie, error: ErrorManager.get(response))
            }
            })
    }
    func getVideos(identifier: Int) {
        self.getVideosRequest?.cancel()
        self.getVideosRequest = RequestFactory.getVideos(identifier: identifier).validate().responseArray(
            keyPath: "results", completionHandler: { (response: DataResponse<[Video]>) in
            switch response.result {
            case .success:
                if let videos = response.result.value {
                    //VideoViewModel.clear()
                    //VideoViewModel.save(videos: videos)
                }
                //self.delegate.success(.videos)
            case .failure:
                print("FAIL")
                //self.delegate.failure(.videos, error: ErrorManager.get(response))
            }
            })
    }
}
