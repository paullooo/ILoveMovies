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
            return "Você ainda não possui favoritos :("
        case 1:
            return "Hey, adicione favoritos :)"
        case 2:
            return "Seus filmes favoritos ficam aqui <3"
        default:
            return ""
        }
    }
    func randomSearchString() -> String {
        let random = arc4random_uniform(3)
        switch random {
        case 0:
            return "Você precisa fazer uma busca <3"
        case 1:
            return "Hey, use a barra de busca :)"
        case 2:
            return "Ainda não tenho nada para mostrar :("
        default:
            return ""
        }
    }
}
