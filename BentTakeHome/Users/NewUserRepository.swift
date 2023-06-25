//
//  NewUserRepository.swift
//  BentTakeHome
//
//  Created by Jon Duenas on 6/25/23.
//

import Foundation

/// Intended to be responsible for creating, providing, and managing a new user. It would abstract
/// the implementation details of the service layer, allowing us to inject whatever we want
/// that conforms to NewUserServing.
@MainActor
final class NewUserRepository: ObservableObject {
    @Published var newUser = User()

    private let service: NewUserServing

    init(service: NewUserServing = NewUserService()) {
        self.service = service
    }
}
