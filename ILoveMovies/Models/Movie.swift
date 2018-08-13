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
    required convenience init?(map: Map) {
        self.init()
    }
    override static func primaryKey() -> String {
        return "identifier"
    }
    func mapping(map: Map) {
        identifier.value <- map["id"]
        title <- map["title"]
        overview <- map["overview"]
        originalTitle <- map["original_title"]
        posterPath <- map["poster_path"]
        backdropPath <- map["backdrop_path"]
    }
}
