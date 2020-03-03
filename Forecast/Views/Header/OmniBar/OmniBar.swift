//
//  OmniBar.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-25.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct OmniBar: View {
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var weather: WeatherProvider
    @EnvironmentObject private var locationPickerState: LocationPickerState

    @State private var isPressed: Bool = false

    var body: some View {
        HStack(alignment: .center, spacing: Dimension.Spacing.barItems) {
            Image(systemName: primaryIcon)

            OmniBarTextField(placeholder: OmniBarPlaceholder(), text: textFieldValueBinding)
                .disabled(textFieldIsReadOnly)

            Spacer()

            OmniBarAuxiliaryButton(icon: auxiliaryIcon, action: clearOrClose)
        }
        .font(Font.callout.weight(.bold))
        .padding(.horizontal, 20)

        .foregroundColor(.white)
        .frame(height: Dimension.Header.omniBarHeight)
        .background(ShadowView(radius: 20, opacity: 0.3, color: .black, cornerRadius: 22))
        .background(BlurView(style: .light, tint: 0.3).cornerRadius(26))
        .gesture(gesture)
        .scaleEffect(scaleEffect)
        .animation(scaleAnimation)
        .onReceive(appState.objectWillChange, perform: clearIfAboutToClose)
    }

    private var textFieldIsReadOnly: Bool {
        !appState.showingLocationPicker
    }

    private var textFieldValueBinding: Binding<String> {
        return .init(get: {
            self.textFieldTextToDisplay

        }, set: { value in
            self.locationPickerState.searchQuery = value
        })
    }

    private var primaryIcon: String {
        if appState.showingLocationPicker || textFieldTextToDisplay.isEmpty {
            return "magnifyingglass"
        }

        if UserSettings.getActiveLocation() != nil {
            return "star.fill"
        }

        return "location.fill"
    }

    private var auxiliaryIcon: String {
        appState.showingLocationPicker ? "xmark.circle.fill" : "slider.horizontal.3"
    }

    private var textFieldTextToDisplay: String {
        if appState.showingLocationPicker {
            return locationPickerState.searchQuery
        }

        if let activeLocation = UserSettings.getActiveLocation() {
            return activeLocation.name
        }

        if let locality = weather.locationManager.lastPlacemark?.locality {
            return locality
        }

        return ""
    }

    private var scaleAnimation: Animation? {
        textFieldIsReadOnly ? AnimationPreset.Touch.shrink : nil
    }

    private var scaleEffect: CGFloat {
        isPressed ? Dimension.Animation.shrinkAmount : 1.0
    }

    private var gesture: _EndedGesture<_ChangedGesture<DragGesture>>? {
        guard textFieldIsReadOnly else {
            return nil
        }

        return DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onChanged { _ in
                self.isPressed = true
            }.onEnded { _ in
                self.isPressed = false

                self.appState.toggleLocationPicker(animated: true)
            }
    }

    private func clearIfAboutToClose(_: AppState.ObjectWillChangePublisher.Output) {
        if !appState.showingLocationPicker {
            locationPickerState.searchQuery = ""
        }
    }

    private func clearOrClose() {
        guard appState.showingLocationPicker else {
            appState.showingSettingsSheet.toggle()
            return
        }

        if locationPickerState.searchQuery.isEmpty {
            appState.toggleLocationPicker(animated: true)
            return
        }

        locationPickerState.searchQuery.clear()
    }
}

struct OmniBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue

            OmniBar()
                .environmentObject(AppState())
                .environmentObject(WeatherProvider())
                .environmentObject(LocationPickerState())
                .padding(20)
        }
        .edgesIgnoringSafeArea(.all)
    }
}
