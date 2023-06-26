//
//  NewUserRootView.swift
//  BentTakeHome
//
//  Created by Jon Duenas on 6/24/23.
//

import SwiftUI

struct NewUserRootView: View {
    @StateObject private var router = NewUserRouter()

    var body: some View {
        NavigationStack(path: $router.path) {
            LoggedOutView()
                .navigationDestination(for: NewUserRouter.Route.self) { route in
                    switch route {
                    case .invite:
                        InviteView()
                    case .logIn:
                        Text("Log In")
                    case .inviteConfirmation(let community):
                        Text(community.name)
                    }
                }
        }
        .preferredColorScheme(.dark)
        .backgroundStyle(Color.bentSortaBlack)
        .foregroundStyle(Color.bentKindaWhite)
        .environmentObject(router)
        .tint(.bentKindaWhite)
    }
}

struct NewUserRootView_Previews: PreviewProvider {
    static var previews: some View {
        NewUserRootView()
            .environmentObject(CommunityRepository(service: CommunityServiceMock()))
    }
}
