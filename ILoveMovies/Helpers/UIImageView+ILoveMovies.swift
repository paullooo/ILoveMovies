//
//  UIImageView+ILoveMovies.swift
//  ILoveMovies
//
//  Created by Developer on 14/08/18.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImageBlur(url: URL!) {
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
        self.kf.indicatorType = .activity
        let processor = ResizingImageProcessor(referenceSize: self.frame.size,
                                               mode: .aspectFill) >> BlurImageProcessor(blurRadius: 10.0)
        self.kf.setImage(with: url, options: [.transition(.fade(1.0)),
                                              .processor(processor), .scaleFactor(UIScreen.main.scale)])
    }
}
