//
//  CommunityRepository.swift
//  BentTakeHome
//
//  Created by Jon Duenas on 6/25/23.
//

import Foundation

/// Intended to be responsible for creating, providing, and managing a new user. It would abstract
/// the implementation details of the service layer, allowing us to inject whatever we want
/// that conforms to CommunityServing.
final class CommunityRepository: ObservableObject {
    @Published var communities: [Community] = []
    
    private let service: CommunityServing

    init(service: CommunityServing = CommunityService()) {
        self.service = service
    }
}
