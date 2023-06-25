//
//  CommunityServing.swift
//  BentTakeHome
//
//  Created by Jon Duenas on 6/25/23.
//

import Foundation

protocol CommunityServing {
    func getCommunity(with inviteCode: String) async throws -> Community?
}
