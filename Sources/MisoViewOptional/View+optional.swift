//
//  View+optional.swift
//  MisoViewOptional
//
//  Created by Michel Donais on 2020-03-03.
//  Copyright © 2020 Misoservices Inc. All rights reserved.
//  [BSL-1.0] This package is Licensed under the Boost Software License - Version 1.0
//

import SwiftUI

public extension View {
    func optional( modifiers: (Self)->AnyView ) -> AnyView {
        modifiers(self)
    }
}
