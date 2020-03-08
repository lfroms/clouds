//
//  AppHostingController.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-03-04.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

final class AppHostingController<Content>: UIHostingController<Content> where Content: View {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
