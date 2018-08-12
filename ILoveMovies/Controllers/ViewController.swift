//
//  ViewController.swift
//  ILoveMovies
//
//

import UIKit

class ViewController: UIViewController {
    var favorites: [MovieView] = []
    @IBOutlet weak var searchButton: UIBarButtonItem!
    @IBOutlet weak var favoriteCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor .secundaryColor
        self.title = "Favoritos"
        self.configureCollectionView()
    }
    func configureCollectionView() {
        self.favoriteCollectionView.dataSource = self
        self.favoriteCollectionView.delegate = self
        self.favoriteCollectionView.backgroundColor = UIColor .secundaryColor
        self.favoriteCollectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil),
                                             forCellWithReuseIdentifier: "favoriteItem")
    }
    @IBAction func searchButtonAction(_ sender: Any) {
     print("Teste")
    }
}

// MARK: - Collection View
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.favorites.count
        return 4
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoriteItem", for: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          //performSegue(withIdentifier: "detailSegue", sender: self.favorites[indexPath.row].identifier)
    }
}
