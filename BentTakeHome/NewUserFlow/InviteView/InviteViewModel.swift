//
//  InviteViewModel.swift
//  BentTakeHome
//
//  Created by Jon Duenas on 6/25/23.
//

import Foundation
import Combine

@MainActor
final class InviteViewModel: ObservableObject {
    enum LoadingState {
        case ready
        case loading
        case loaded(Community)
        case error(Error)

        var isLoading: Bool {
            if case .loading = self {
                return true
            } else {
                return false
            }
        }
    }

    @Published var inviteCode: String = ""
    @Published var loadingState: LoadingState = .ready
    @Published var error: Error?
    @Published var errorAlertIsPresented: Bool = false

    // Quick and easy way to add a link inline with a string. But has downsides, like launching in
    // default Safari app only, making your user leave your app. Also can't add underline.
    var footerText: AttributedString = {
        do {
            let string = try AttributedString(
                markdown: "Don’t have an invite? [Learn what you can do](https://google.com)."
            )
            return string
        } catch {
            print(error)
            return ""
        }
    }()

    var communityRepository: CommunityRepository?
    var router: NewUserRouter?

    private var cancellables: Set<AnyCancellable> = []

    init() {
        $loadingState
            .dropFirst()
            .sink { [weak self] state in
                guard let self else { return }
                switch state {
                case .ready, .loading: break
                case .loaded(let community):
                    router?.path.append(.inviteConfirmation(community))
                case .error(let error):
                    self.error = error
                    errorAlertIsPresented = true
                }
            }
            .store(in: &cancellables)
    }

    func nextButtonTapped() {
        getCommunity()
    }

    func textFieldSubmitted() {
        getCommunity()
    }

    func errorAlertOKButtonTapped() {
        loadingState = .ready
        error = nil
        errorAlertIsPresented = false
    }

    private func getCommunity() {
        guard let communityRepository, !loadingState.isLoading else { return }

        Task {
            loadingState = .loading

            do {
                let community = try await communityRepository.getCommunity(with: inviteCode)
                loadingState = .loaded(community)
            } catch {
                // More robust logging would be done here
                print(error)
                loadingState = .error(error)
            }
        }
    }
}
