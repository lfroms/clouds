//
//  Debouncer.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2020-08-23.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation

public class Debouncer {
    private let delay: TimeInterval
    private var workItem: DispatchWorkItem?

    public init(delay: TimeInterval) {
        self.delay = delay
    }

    public func run(action: @escaping () -> Void) {
        workItem?.cancel()
        workItem = DispatchWorkItem(block: action)
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: workItem!)
    }
}
