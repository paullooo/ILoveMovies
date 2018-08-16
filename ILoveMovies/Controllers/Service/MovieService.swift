//
//  MovieService.swift
//  ILoveMovies
//
//  Created by Developer on 11/08/18.
//
import Alamofire
import AlamofireObjectMapper

protocol MovieServiceDelegate: class {
    func searchMoviesSuccess(movies: [Movie])
    func searchMoviesFailure()
    func getMovieSuccess()
    func getMovieFailure()
    func getImageSuccess()
    func getImageFailure()
}
extension MovieServiceDelegate {
    func searchMoviesSuccess(movies: [Movie]) { // Faz com que os metodos não sejam obrigatorios, mas se for chamado e não for implementado ele crasha
        fatalError("Precisa ser implementado")
    }
}
class MovieService {
    var getMoviesRequest: DataRequest?
    var getSimilarMovie: DataRequest?
    var getMovieRequest: DataRequest?
    var getImagesRequest: DataRequest?
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
                        self.delegate?.searchMoviesSuccess(movies: movies)
                    }
                case .failure:
                    self.delegate?.searchMoviesFailure()
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
                        MovieViewModel.save(movies: movie)
                    }
                    self.delegate?.getMovieSuccess()
                    self.getImages(identifier: identifier)
                case .failure:
                    self.delegate?.getMovieFailure()
                }
            })
    }
    func getImages(identifier: Int) {
        self.getImagesRequest?.cancel()
        self.getImagesRequest = RequestFactory.getImages(identifier: identifier).validate().responseArray(
            keyPath: "backdrops", completionHandler: { (response: DataResponse<[Backdrop]>) in
                switch response.result {
                case .success:
                    if let backdrops = response.result.value {
                        MovieViewModel.saveImages(identifier: identifier, backdrops: backdrops)
                    }
                    self.delegate?.getImageSuccess()
                case .failure:
                    print("Error")
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
