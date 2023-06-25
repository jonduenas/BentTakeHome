//
//  LoggedOutView.swift
//  BentTakeHome
//
//  Created by Jon Duenas on 6/24/23.
//

import SwiftUI

struct LoggedOutView: View {
    @StateObject private var viewModel = LoggedOutViewModel()
    @EnvironmentObject private var router: NewUserRouter

    var body: some View {
        VStack {
            Spacer()

            Image(.bentLogoAsset)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250)
                .accessibilityLabel("Bent")

            Text("Queer Communities")
                .padding()
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .dynamicTypeSize(.xSmall ... .accessibility3)

            Spacer()

            Text(viewModel.termsAndConditions)
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()
                .dynamicTypeSize(.xSmall ... .accessibility2)

            Button("Sign up") {
                viewModel.didTapSignUp()
            }
            .buttonStyle(BentPrimaryButton())

            Button("Log in") {
                viewModel.didTapLogIn()
            }
            .buttonStyle(BentSecondaryButton())
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 12)
        .background()
        .onAppear {
            viewModel.router = router
        }
    }
}

struct LoggedOutView_Previews: PreviewProvider {
    static var previews: some View {
        LoggedOutView()
            .environmentObject(NewUserRouter())
            .preferredColorScheme(.dark)
    }
}
