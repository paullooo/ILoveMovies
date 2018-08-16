//
//  Alert+ILoveMovie.swift
//  ILoveMovies
//
//  Created by Developer on 14/08/18.
//

import Foundation
import SwiftMessages

class AlertView {
    func sucessMessage(message: String) {
    let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(.success)
        view.configureDropShadow()
        view.button?.isHidden = true
        view.titleLabel?.isHidden = true
        view.iconImageView?.isHidden = true
        view.configureContent(body: message)
        SwiftMessages.show(view: view)
    }
    func failMessage(message: String) {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(.error)
        view.configureDropShadow()
        view.button?.isHidden = true
        view.titleLabel?.isHidden = true
        view.iconImageView?.isHidden = true
        view.configureContent(body: message)
        SwiftMessages.show(view: view)
    }
}
