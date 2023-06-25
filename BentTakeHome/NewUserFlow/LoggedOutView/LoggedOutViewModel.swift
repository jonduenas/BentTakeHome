//
//  LoggedOutViewModel.swift
//  BentTakeHome
//
//  Created by Jon Duenas on 6/24/23.
//

import Foundation

@MainActor
final class LoggedOutViewModel: ObservableObject {
    var router: NewUserRouter?

    // Quick and easy way to add a link inline with a string. But has downsides, like launching in
    // default Safari app only, making your user leave your app. Also can't add underline.
    let termsAndConditions: AttributedString = {
        do {
            let string = try AttributedString(
                markdown:
                """
                By tapping sign up, I agree I’m 18 or older, and to the \
                [Terms of Use](https://google.com) & \
                [Privacy Policy](https://google.com)
                """
            )
            return string
        } catch {
            print(error)
            return ""
        }
    }()

    func didTapSignUp() {
        router?.path.append(.invite)
    }

    func didTapLogIn() {
        router?.path.append(.logIn)
    }
}
