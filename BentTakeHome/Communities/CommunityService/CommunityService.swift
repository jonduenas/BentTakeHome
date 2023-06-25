//
//  CommunityService.swift
//  BentTakeHome
//
//  Created by Jon Duenas on 6/25/23.
//

import Foundation

final class CommunityService: CommunityServing {
    /// Real implementation would use Networking layer to connect with API, decode the data, and return `Community`.
    func getCommunity(with inviteCode: String) async throws -> Community? {
        let community = Community(id: UUID(), name: "Queer League Comics", members: [], inviteCode: "SUPERGAY")

        // Mock network call
        try await Task.sleep(for: .seconds(2))

        // Actual logic would likely be done on server. If API instead returns all communities,
        // we would instead have an array of Community that we could then do
        // array.filter { $0.inviteCode == inviteCode } to return the appropriate community.
        if community.inviteCode == inviteCode {
            return community
        } else {
            return nil
        }
    }
}
