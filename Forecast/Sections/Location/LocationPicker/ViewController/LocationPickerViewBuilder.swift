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
        
        if data.state == .searching {
            sections.append(searchSection(searchResults: data.searchResults, loading: data.loadingSearch))
            return sections
        }
        
        if let currentLocation = data.currentLocation {
            sections.append(currentLocationSection(currentLocation: currentLocation, loading: data.loadingCurrentLocation))
        }
        
        if data.favoriteLocations.count > 0 {
            sections.append(favoriteLocationsSection(favoriteLocations: data.favoriteLocations, loading: data.loadingFavorites))
        }
        
        return sections
    }
    
    func currentLocationSection(currentLocation: Location, loading: Bool) -> UIStackView {
        let currentLocationSubviews: [UIView] = [
            loadableSectionHeader(header: sectionLabel(text: "Current location"), loading: loading),
            currentLocationItem(icon: "location.fill", location: currentLocation)
        ]
        
        return sectionStack(items: currentLocationSubviews)
    }
    
    func favoriteLocationsSection(favoriteLocations: [Location], loading: Bool) -> UIStackView {
        var favoriteLocationSubviews: [UIView] = [
            loadableSectionHeader(header: sectionLabel(text: "Favourites"), loading: loading)
        ]
        
        favoriteLocations.forEach { favoriteLocation in
            favoriteLocationSubviews.append(favoriteLocationItem(icon: "star.fill", location: favoriteLocation))
        }
        
        return sectionStack(items: favoriteLocationSubviews)
    }
    
    func searchSection(searchResults: [Location]?, loading: Bool) -> UIStackView {
        var searchResultSubviews: [UIView] = [
            loadableSectionHeader(header: sectionLabel(text: "Results"), loading: loading)
        ]
        
        if let results = searchResults {
            results.forEach { location in
                searchResultSubviews.append(searchResultLocationItem(location: location))
            }
        }
        
        return sectionStack(items: searchResultSubviews)
    }
    
    // MARK: - Atoms
    
    private func currentLocationItem(icon: String, location: Location) -> UIView {
        return HostingView(rootView: CurrentLocationItem(icon: icon, location: location))
    }
    
    private func locationSearchResult(location: Location) -> UIView {
        return HostingView(rootView: LocationSearchResultItem(location: location))
    }
    
    private func favoriteLocationItem(icon: String, location: Location) -> UIView {
        return HostingView(rootView: FavoriteLocationItem(icon: icon, location: location))
    }
    
    private func searchResultLocationItem(location: Location) -> UIView {
        return HostingView(rootView: SearchResultLocationItem(location: location))
    }
    
    private func sectionLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.preferredFont(for: .callout, weight: .semibold)
        label.textColor = .white
        
        return label
    }
    
    private func loadableSectionHeader(header: UIView, loading: Bool) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = Dimension.LocationPicker.itemSpacing
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        
        stackView.addArrangedSubview(header)
        
        if loading {
            let spinner = HostingView(rootView: LineActivityIndicator(color: .secondary))
            stackView.addArrangedSubview(spinner)
        }
        
        return stackView
    }
    
    private func sectionStack(items: [UIView]) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Dimension.LocationPicker.itemSpacing
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        
        stackView.addArrangedSubviews(items)
        
        return stackView
    }
}
