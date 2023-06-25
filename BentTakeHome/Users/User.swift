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

    init(
        id: UUID = UUID(),
        name: String = "",
        phoneNumber: String = "",
        email: String = "",
        birthDate: Date = .now,
        pronouns: [User.Pronouns] = [],
        location: String? = nil,
        profilePhotoURL: URL? = nil
    ) {
        self.id = id
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
        self.birthDate = birthDate
        self.pronouns = pronouns
        self.location = location
        self.profilePhotoURL = profilePhotoURL
    }
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
