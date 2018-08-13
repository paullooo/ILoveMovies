//
//  ViewController.swift
//  ILoveMovies
//
//

import UIKit

class ViewController: UIViewController {
    var favorites: [MovieView] = []
    var randomString: RandomString!
    @IBOutlet weak var searchButton: UIBarButtonItem!
    @IBOutlet weak var favoriteCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor .secundaryColor
        self.title = "Favoritos"
        self.randomString = RandomString()
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
     performSegue(withIdentifier: "searchSegue", sender: sender)
    }
}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.favorites.isEmpty {
            collectionView.setEmptyMessage(self.randomString.randomFavoriteString())
        } else {
            collectionView.removeEmptyMessage()
        }
        return self.favorites.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoriteItem", for: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         performSegue(withIdentifier: "detailSegue", sender: self.favorites[indexPath.row].identifier)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
}
