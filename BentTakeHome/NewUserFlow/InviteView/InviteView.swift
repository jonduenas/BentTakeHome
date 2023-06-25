//
//  InviteView.swift
//  BentTakeHome
//
//  Created by Jon Duenas on 6/24/23.
//

import SwiftUI

struct InviteView: View {
    @StateObject private var viewModel = InviteViewModel()
    @EnvironmentObject private var communityRepository: CommunityRepository

    @FocusState private var textFieldFocused: Bool

    var body: some View {
        ScrollView {
            VStack {
                Text("Enter your invite code")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Bent requires an invitation from an existing community to get started.")

                TextField(
                    "Invite Code",
                    text: $viewModel.inviteCode,
                    prompt: Text("Enter your invite code...")
                )
                .multilineTextAlignment(.leading)
                .textFieldStyle(.roundedBorder)
                .focused($textFieldFocused)

                Text("Don’t have an invite? Learn what you can do.")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
        .background()
        .safeAreaInset(edge: .bottom) {
            Button("Next") {

            }
            .buttonStyle(BentPrimaryButton())
            .padding()
        }
        .onAppear {
            if viewModel.communityRepository == nil {
                viewModel.communityRepository = communityRepository
            }

            textFieldFocused = true
        }
    }
}

struct InviteView_Previews: PreviewProvider {
    static var previews: some View {
        InviteView()
            .preferredColorScheme(.dark)
            .environmentObject(CommunityRepository(service: CommunityServiceMock()))
    }
}
