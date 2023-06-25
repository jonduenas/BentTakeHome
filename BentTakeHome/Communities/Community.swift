//
//  Community.swift
//  BentTakeHome
//
//  Created by Jon Duenas on 6/24/23.
//

import Foundation

struct Community: Identifiable, Equatable, Hashable, Codable {
    let id: UUID
    let name: String
    let members: [User]
    let inviteCode: String
}
