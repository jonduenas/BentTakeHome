//
//  CommunityServiceMock.swift
//  BentTakeHome
//
//  Created by Jon Duenas on 6/25/23.
//

import Foundation

class CommunityServiceMock: CommunityServing {
    var expectedCommunity: Community? = Community(
        id: UUID(),
        name: "Queer League Comics",
        members: [],
        inviteCode: "SUPERGAY"
    )

    func getCommunity(with inviteCode: String) async throws -> Community? {
        return expectedCommunity
    }
}
