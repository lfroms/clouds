//
//  LocationPickerViewBuilder.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import UIKit

class LocationPickerViewBuilder {
    func locationItem(icon: String, title: String) -> UIView {
        return HostingView(rootView: LocationItem(icon: icon, title: title))
    }
}
