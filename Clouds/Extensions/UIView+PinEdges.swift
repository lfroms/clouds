//
//  UIView+PinEdges.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2019-11-09.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import UIKit

extension UIView {
    enum Edges {
        case all
        case top
        case bottom
        case leading
        case trailing
    }

    func pinEdges(_ edges: [Edges] = [.all], to view: UIView, usingLayoutMargins: Bool = false) {
        self.translatesAutoresizingMaskIntoConstraints = false

        let leadingAnchor = usingLayoutMargins ? view.layoutMarginsGuide.leadingAnchor : view.leadingAnchor
        let trailingAnchor = usingLayoutMargins ? view.layoutMarginsGuide.trailingAnchor : view.trailingAnchor
        let topAnchor = usingLayoutMargins ? view.layoutMarginsGuide.topAnchor : view.topAnchor
        let bottomAnchor = usingLayoutMargins ? view.layoutMarginsGuide.bottomAnchor : view.bottomAnchor

        if edges.contains(.leading) || edges.contains(.all) {
            view.addConstraint(self.leadingAnchor.constraint(equalTo: leadingAnchor))
        }

        if edges.contains(.trailing) || edges.contains(.all) {
            view.addConstraint(self.trailingAnchor.constraint(equalTo: trailingAnchor))
        }

        if edges.contains(.top) || edges.contains(.all) {
            view.addConstraint(self.topAnchor.constraint(equalTo: topAnchor))
        }

        if edges.contains(.bottom) || edges.contains(.all) {
            view.addConstraint(self.bottomAnchor.constraint(equalTo: bottomAnchor))
        }
    }
}
