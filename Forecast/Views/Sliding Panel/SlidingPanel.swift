//
//  SlidingPanel.swift
//  Forecast
//
//  Created by Lukas Romsicki on 2019-10-26.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SlidingPanel<Content: View>: View {
    @GestureState private var dragState: DragState = .inactive
    @State var cardState: CardState = .closed
    
    var content: () -> Content
    
    var body: some View {
        let drag = DragGesture()
            .updating($dragState) { drag, state, _ in
                state = .dragging(translation: drag.translation)
            }
            .onEnded(onDragEnded)
        
        return content()
            .offset(y: logConstraintValueForYPoisition(yPosition: self.cardState.rawValue + self.dragState.translation.height, translation: self.dragState.translation.height))
            .animation(animation)
            .gesture(drag)
    }
    
    private func onDragEnded(drag: DragGesture.Value) {
        let verticalDirection = drag.predictedEndLocation.y - drag.location.y
        let cardTopEdgeLocation = self.cardState.rawValue + drag.translation.height
        
        let closestPosition: CardState
        
        if (cardTopEdgeLocation - CardState.open.rawValue) < (CardState.closed.rawValue - cardTopEdgeLocation) {
            closestPosition = .closed
        } else {
            closestPosition = .open
        }
        
        if verticalDirection > 0 {
            self.cardState = CardState.closed
        } else if verticalDirection < 0 {
            self.cardState = CardState.open
        } else {
            self.cardState = closestPosition
        }
    }
    
    func logConstraintValueForYPoisition(yPosition: CGFloat, translation: CGFloat) -> CGFloat {
        if yPosition > -200, yPosition < 0 {
            return yPosition
        }
        
        return yPosition >= 0 ? pow(yPosition, 0.7) : CardState.open.rawValue - pow(-yPosition + CardState.open.rawValue, 0.7)
    }
    
    private var animation: Animation? {
        guard !self.dragState.isDragging else {
            return nil
        }
        
        return .interpolatingSpring(
            stiffness: 300.0,
            damping: 30.0,
            initialVelocity: 10.0
        )
    }
}

enum CardState: CGFloat {
    case closed = 0
    case open = -200
}

enum DragState {
    case inactive
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}

struct SlidingPanel_Previews: PreviewProvider {
    static var previews: some View {
        SlidingPanel {
            EmptyView()
        }
    }
}
