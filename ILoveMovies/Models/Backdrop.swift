//
//  Backdrop.swift
//  ILoveMovies
//
//  Created by Developer on 16/08/18.
//

import ObjectMapper

class Backdrop: Mappable {
    var filePath = ""
    required convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        filePath <- map["file_path"]
    }
}
