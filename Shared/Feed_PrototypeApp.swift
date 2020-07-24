//
//  Feed_PrototypeApp.swift
//  Shared
//
//  Created by Tassilo Bouwman on 11/07/2020.
//

import SwiftUI

@main
struct Feed_PrototypeApp: App {
    @StateObject private var feedStore = FeedStore()

    var body: some Scene {
        WindowGroup {
            ContentView(store: testStore)
        }
    }
}
