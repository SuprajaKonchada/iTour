//
//  iTourApp.swift
//  iTour
//
//  Created by user262000 on 3/12/25.
//

import SwiftUI
import SwiftData

@main
struct iTourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Destination.self)
    }
}
