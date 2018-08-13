//
//  MovieService.swift
//  ILoveMovies
//
//  Created by Developer on 11/08/18.
//
import Alamofire
import AlamofireObjectMapper

protocol MovieServiceDelegate: class {
    func searchMoviesSuccess()
    func searchMoviesFailure(error: String)
}
class MovieService {
    var getMoviesRequest: DataRequest?
    var getSimilarMovie: DataRequest?
    var getMovieRequest: DataRequest?
    var getVideosRequest: DataRequest?
    var getSimilarMoviesRequest: DataRequest?
    weak var delegate: MovieServiceDelegate?
    required init(delegate: MovieServiceDelegate) {
        self.delegate = delegate
    }
    func getMovies(search string: String) {
        self.getMoviesRequest?.cancel()
        self.getMoviesRequest = RequestFactory.getMovieSearch(with: string).validate().responseArray(
            keyPath: "results", completionHandler: { (response: DataResponse<[Movie]>) in
            switch response.result {
            case .success:
                if let movies = response.result.value {
                    MovieViewModel.clear()
                    MovieViewModel.save(movies: movies)
                    self.delegate?.searchMoviesSuccess()
                }
            case .failure:
                  print("Fail")
//                 self.delegate.searchMoviesFailure(error: response)
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
                    MovieViewModel.save(movies: [movie])
                }
            case .failure:
                print("FAIL")
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
            case .failure:
                print("FAIL")
            }
            })
    }
}
