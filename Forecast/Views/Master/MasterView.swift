//
//  MasterView.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-25.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct MasterView<Content: View>: View {
    var usesStandardLayout: Bool
    var handleExists: Bool
    var handleHidden: Bool

    var content: () -> Content

    @inlinable init(usesStandardLayout: Bool = false, handleExists: Bool, handleHidden: Bool, @ViewBuilder content: @escaping () -> Content) {
        self.usesStandardLayout = usesStandardLayout
        self.handleExists = handleExists
        self.handleHidden = handleHidden
        self.content = content
    }

    var body: some View {
        Group {
            if usesStandardLayout {
                content()
            } else {
                MasterViewLayout(handleExists: handleExists, handleHidden: handleHidden, content: content)
                    .equatable()
            }
        }
        .clipShape(RoundedCornerShape(cornerRadius: 22, style: .continuous, corners: [.bottomLeft, .bottomRight]))
    }
}

extension MasterView: Equatable {
    static func == (lhs: MasterView<Content>, rhs: MasterView<Content>) -> Bool {
        lhs.usesStandardLayout == rhs.usesStandardLayout
            && lhs.handleExists == rhs.handleExists
            && lhs.handleHidden == rhs.handleHidden
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(usesStandardLayout: true, handleExists: false, handleHidden: false) {
            Text("Test content")
        }
    }
}
