//
//  MovieRequestFactory.swift
//  ILoveMovies
//
//  Created by Developer on 11/08/18.
//
import Alamofire
class RequestFactory {
    static func getMovieSearch(with string: String) -> DataRequest {
        let params: Parameters = ["api_key": apiKey, "language": "pt-BR", "query": string]
        return Alamofire.request(baseURL + "search/movie", method: .get, parameters: params)
    }
    static func getMovie(identifier: Int) -> DataRequest {
        let params: Parameters = ["api_key": apiKey, "language": "pt-BR"]
        return Alamofire.request(baseURL + "movie/\(identifier)", method: .get, parameters: params)
    }
    static func getVideos(identifier: Int) -> DataRequest {
        let params: Parameters = ["api_key": apiKey, "language": "pt-BR"]
        return Alamofire.request(baseURL + "movie/\(identifier)/videos", method: .get, parameters: params)
    }
    static func getSimilarMovie(identifier: Int) -> DataRequest {
        let params: Parameters = ["api_key": apiKey, "language": "pt-BR"]
        return Alamofire.request(baseURL + "movie/\(identifier)/similar", method: .get, parameters: params)
    }
}
