//
//  CommunityRepository.swift
//  BentTakeHome
//
//  Created by Jon Duenas on 6/25/23.
//

import Foundation

/// Intended to be responsible for creating, providing, and managing a community. It would abstract
/// the implementation details of the service layer, allowing us to inject whatever we want
/// that conforms to CommunityServing.
final class CommunityRepository: ObservableObject {
    enum Error: Swift.Error {
        case invalidInviteCode
    }

    @Published var communities: [Community] = []
    
    private let service: CommunityServing

    init(service: CommunityServing = CommunityService()) {
        self.service = service
    }

    func getCommunity(with inviteCode: String) async throws -> Community {
        guard let community = try await service.getCommunity(with: inviteCode) else {
            throw Error.invalidInviteCode
        }

        return community
    }
}

extension CommunityRepository.Error: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidInviteCode:
            return "Invalid invite code."
        }
    }
}
