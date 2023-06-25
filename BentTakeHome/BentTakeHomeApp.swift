//
//  BentTakeHomeApp.swift
//  BentTakeHome
//
//  Created by Jon Duenas on 6/24/23.
//

import SwiftUI

@main
struct BentTakeHomeApp: App {
    @StateObject private var communityRepository = CommunityRepository()

    var body: some Scene {
        WindowGroup {
            NewUserRootView()
                .environmentObject(communityRepository)
        }
    }
}
