//
//  FriendsApp.swift
//  Friends
//
//  Created by Shomil Singh on 26/03/24.
//

import SwiftUI
import SwiftData

@main
struct FriendsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: User.self)
        }
    }
}
