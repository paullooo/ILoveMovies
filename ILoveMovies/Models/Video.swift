//
//  Video.swift
//  ILoveMovies
//
//
import ObjectMapper

class Video: Mappable {
    var identifier = ""
    var key = ""
    var site = ""
    required convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        identifier <- map["id"]
        key <- map["key"]
        site <- map["site"]
    }
}
