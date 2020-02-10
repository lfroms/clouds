//
//  LocationPickerSection.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2020-02-09.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LocationPickerSection: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        ZStack(alignment: Alignment.topLeading) {
            BlackBackground()
                .edgesIgnoringSafeArea(.all)

            DismissableScrollView(didPerformDismiss: handlePickerDismiss) {
                self.memes()
                self.memes()
                self.memes()
                self.memes()
                self.memes()
                self.memes()
                self.memes()
                self.memes()
                self.memes()
                self.memes()
            }
        }
    }

    private func memes() -> some View {
        VStack {
            Text("moo")
            Text("moo")
            Text("moo")
            Text("moo")
            Text("moo")
            Text("moo")
            Text("moo")
        }
        .background(Color.red)
    }

    private func handlePickerDismiss() {
        self.appState.toggleLocationPicker(animated: true)
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        LocationPickerSection()
    }
}
