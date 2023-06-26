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
    @EnvironmentObject private var router: NewUserRouter

    @FocusState private var textFieldFocused: Bool

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("Enter your invite code")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Bent requires an invitation from an existing community to get started.")

                BentTextField(
                    "Invite Code",
                    text: $viewModel.inviteCode,
                    prompt: Text("Enter your invite code...")
                )
                .focused($textFieldFocused)
                .onSubmit {
                    viewModel.textFieldSubmitted()
                }

                Text(viewModel.footerText)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
        .bentTitleToolbar()
        .background()
        .safeAreaInset(edge: .bottom) {
            nextButton
        }
        .alert(
            "Error",
            isPresented: $viewModel.errorAlertIsPresented,
            presenting: viewModel.error,
            actions: { _ in
                Button("OK") {
                    viewModel.errorAlertOKButtonTapped()
                }
            },
            message: { error in
                Text(error.localizedDescription)
            }
        )
        .onAppear {
            viewModel.communityRepository = communityRepository
            viewModel.router = router
            textFieldFocused = true
        }
        .onDisappear {
            viewModel.onDisappear()
        }
    }

    private var nextButton: some View {
        Button {
            viewModel.nextButtonTapped()
        } label: {
            ZStack {
                if viewModel.loadingState.isLoading {
                    ProgressView()
                        .tint(.bentSortaBlack)
                }

                Text("Next")
                    .opacity(viewModel.loadingState.isLoading ? 0 : 1)
            }

        }
        .buttonStyle(BentPrimaryButton())
        .padding()
    }
}

struct InviteView_Previews: PreviewProvider {
    static var previews: some View {
        InviteView()
            .preferredColorScheme(.dark)
            .environmentObject(NewUserRouter())
            .environmentObject(CommunityRepository(service: CommunityServiceMock()))
    }
}
