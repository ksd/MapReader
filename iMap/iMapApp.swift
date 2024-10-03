//
//  iMapApp.swift
//  iMap
//
//  Created by ksd on 25/09/2024.
//

import SwiftUI

@main
struct iMapApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environment(MarkerController())
        }
    }
}
