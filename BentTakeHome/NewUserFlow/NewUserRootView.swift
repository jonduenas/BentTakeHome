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
                .preferredColorScheme(.dark)
                .navigationDestination(for: NewUserRouter.Route.self) { route in
                    switch route {
                    case .invite:
                        InviteView()
                    case .logIn:
                        Text("Log In")
                    }
                }
        }
        .environmentObject(router)
        .tint(.bentKindaWhite)
    }
}

extension View {
    func bentTitleToolbar() -> some View {
        self.navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image(.bentLogoTextAsset)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(12)
                }
            }
    }
}

struct NewUserRootView_Previews: PreviewProvider {
    static var previews: some View {
        NewUserRootView()
    }
}
