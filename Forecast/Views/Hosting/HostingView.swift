//
//  HostingView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

open class HostingView<Content>: UIView where Content: View {
    private let hostingVC: UIHostingController<Content>

    public var rootView: Content {
        get { return hostingVC.rootView }
        set { hostingVC.rootView = newValue }
    }

    public init(rootView: Content) {
        self.hostingVC = UIHostingController(rootView: rootView)
        super.init(frame: .zero)
        addSubview(hostingVC.view)
        hostingVC.view.translatesAutoresizingMaskIntoConstraints = false
        hostingVC.view.backgroundColor = .clear
        NSLayoutConstraint.activate([
            hostingVC.view.topAnchor.constraint(equalTo: topAnchor),
            hostingVC.view.bottomAnchor.constraint(equalTo: bottomAnchor),
            hostingVC.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            hostingVC.view.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
