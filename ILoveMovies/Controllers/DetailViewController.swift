//
//  DetailViewController.swift
//  ILoveMovies
//
//  Created by Developer on 13/08/18.
//

import UIKit

class DetailViewController: UIViewController {
    var service: MovieService!
    var movieDetailIdentifier: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor .secundaryColor
    }
    override func viewWillAppear(_ animated: Bool) {
        print(movieDetailIdentifier)
    }
}
