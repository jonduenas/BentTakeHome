//
//  NewUserRoute.swift
//  BentTakeHome
//
//  Created by Jon Duenas on 6/24/23.
//

import Foundation

@MainActor
final class NewUserRouter: ObservableObject {
    enum Route: Hashable {
        case logIn
        case invite
        case inviteConfirmation(Community)
        //    case createAccount
        // This would eventually be filled with more routes
    }

    @Published var path: [Route] = []

    func push(_ route: Route) {
        path.append(route)
    }

    func popToRoot() {
        path = []
    }
}
