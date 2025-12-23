//
//  PedalionApp.swift
//  Pedalion
//
//  Created by Sajan Lawrence on 21/12/25.
//

import SwiftUI

@main
struct PedalionApp: App {
    @State private var homeVM = HomeViewModel()
    @State private var tabRouter = TabRouter()
    var body: some Scene {
        WindowGroup {
            RootView()
            .environment(homeVM)
            .environment(tabRouter)
            .preferredColorScheme(.dark)
        }
    }
}
