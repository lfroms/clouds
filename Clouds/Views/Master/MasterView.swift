//
//  MasterView.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2019-10-25.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct MasterView<Content: View>: View {
    var handleExists: Bool
    var handleHidden: Bool

    var content: () -> Content

    @inlinable init(handleExists: Bool = true, handleHidden: Bool = false, @ViewBuilder content: @escaping () -> Content) {
        self.handleExists = handleExists
        self.handleHidden = handleHidden
        self.content = content
    }

    var body: some View {
        MasterViewLayout(handleExists: handleExists, handleHidden: handleHidden) {
            self.content()
        }
        .equatable()
    }
}

extension MasterView: Equatable {
    static func == (lhs: MasterView<Content>, rhs: MasterView<Content>) -> Bool {
        lhs.handleExists == rhs.handleExists && lhs.handleHidden == rhs.handleHidden
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(handleExists: false, handleHidden: false) {
            Text("Test content")
        }
    }
}
