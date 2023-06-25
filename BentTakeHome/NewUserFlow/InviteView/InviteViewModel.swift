//
//  InviteViewModel.swift
//  BentTakeHome
//
//  Created by Jon Duenas on 6/25/23.
//

import Foundation

@MainActor
final class InviteViewModel: ObservableObject {
    @Published var inviteCode: String = ""
    
    var communityRepository: CommunityRepository?
}
