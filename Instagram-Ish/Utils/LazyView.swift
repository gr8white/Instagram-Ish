//
//  LazyView.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 8/3/23.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
