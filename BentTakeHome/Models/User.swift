//
//  User.swift
//  BentTakeHome
//
//  Created by Jon Duenas on 6/24/23.
//

import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    var name: String
    var phoneNumber: String
    var email: String
    var birthDate: Date
    var pronouns: [Pronouns]
    var location: String? // This might be modeled differently based on how the backend stores it
    var profilePhotoURL: URL?
}

extension User {
    enum Pronouns: Identifiable, Codable {
        case heHim
        case sheHer
        case theyThem
        case zeZir
        case zeHir
        case xeXem
        case any

        var id: Self { self }
    }
}
