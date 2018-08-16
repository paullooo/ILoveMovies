//
//  RandomStrings.swift
//  ILoveMovies
//
//  Created by Developer on 12/08/18.
//

import UIKit

class RandomString {
    func randomFavoriteString() -> String {
        let random = arc4random_uniform(3)
        switch random {
        case 0:
            return NSLocalizedString("Favorite1", comment: "")
        case 1:
            return NSLocalizedString("Favorite2", comment: "")
        case 2:
            return NSLocalizedString("Favorite3", comment: "")
        default:
            return ""
        }
    }
    func randomSearchString() -> String {
        let random = arc4random_uniform(3)
        switch random {
        case 0:
            return NSLocalizedString("Search1", comment: "")
        case 1:
            return NSLocalizedString("Search2", comment: "")
        case 2:
            return NSLocalizedString("Search3", comment: "")
        default:
            return ""
        }
    }
}
