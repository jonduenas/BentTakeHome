//
//  Community.swift
//  BentTakeHome
//
//  Created by Jon Duenas on 6/24/23.
//

import Foundation

struct Community: Identifiable, Codable {
    let id: UUID
    let name: String
    let members: [User]
}
