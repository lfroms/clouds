//
//  LocationPickerViewBuilder.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import UIKit

class LocationPickerViewBuilder {
    func sections(data: LocationPickerData) -> [UIView] {
        var sections: [UIView] = []
        
        if let currentLocation = data.currentLocation {
            sections.append(currentLocationSection(currentLocation: currentLocation))
        }
        
        return sections
    }
    
    func currentLocationSection(currentLocation: Location) -> UIStackView {
        let currentLocationSubviews: [UIView] = [
            sectionLabel(text: "Current location"),
            locationItem(icon: "location.fill", location: currentLocation)
        ]
        
        return sectionStack(items: currentLocationSubviews)
    }
    
    // MARK: - Atoms
    
    private func locationItem(icon: String, location: Location) -> UIView {
        return HostingView(rootView: LocationItem(icon: icon, location: location))
    }
    
    private func sectionLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.preferredFont(for: .callout, weight: .semibold)
        label.textColor = .white
        
        return label
    }
    
    private func sectionStack(items: [UIView]) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Dimension.LocationPicker.itemSpacing
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        
        items.forEach { item in
            stackView.addArrangedSubview(item)
        }
        
        return stackView
    }
}
