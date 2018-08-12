//
//  Movie.swift
//  ILoveMovies
//
//
import RealmSwift
import ObjectMapper

class Movie: Object, Mappable {
    var identifier = RealmOptional<Int>()
    @objc dynamic var title: String?
    @objc dynamic var backdropPath: String?
    @objc dynamic var originalTitle: String?
    @objc dynamic var posterPath: String?
    @objc dynamic var overview: String?
    @objc dynamic var releaseDate: Date?
    @objc dynamic var favorite: Bool = false
    @objc dynamic var trailer: String?
    var backdrops = List<String>()
    override static func primaryKey() -> String {
        return "identifier"
    }
    required convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        identifier <- map["id"]
        title <- map["title"]
        originalTitle <- map["original_title"]
        posterPath <- map["poster_path"]
        backdropPath <- map["backdrop_path"]
        overview <- map["overview"]
        releaseDate <- (map["release_date"])
    }
}
