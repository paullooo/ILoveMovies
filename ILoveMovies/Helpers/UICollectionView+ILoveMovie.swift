//
//  UICollectionView+ILoveMovie.swift
//  ILoveMovies
//
//  Created by Developer on 11/08/18.
//

import UIKit

extension UICollectionView {
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width,
                                                 height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.textColor = UIColor .white
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 20)
        messageLabel.sizeToFit()
        self.backgroundView = messageLabel
    }
    func removeEmptyMessage() {
        self.backgroundView = nil
    }
}
