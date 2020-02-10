//
//  HostableViewController.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-09.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation
import SwiftUI

protocol HostableViewController: UIViewController {
    var hostingController: UIHostingController<AnyView> { get set }
}
