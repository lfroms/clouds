//
//  UIView+PinEdges.swift
//  Forecast
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
    
    func pinEdges(_ edges: [Edges], to view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if edges.contains(.leading) || edges.contains(.all) {
            view.addConstraint(self.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        }
        
        if edges.contains(.trailing) || edges.contains(.all) {
            view.addConstraint(self.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        }
        
        if edges.contains(.top) || edges.contains(.all) {
            view.addConstraint(self.topAnchor.constraint(equalTo: view.topAnchor))
        }
        
        if edges.contains(.bottom) || edges.contains(.all) {
            view.addConstraint(self.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        }
    }
}
