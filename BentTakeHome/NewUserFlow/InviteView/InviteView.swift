//
//  InviteView.swift
//  BentTakeHome
//
//  Created by Jon Duenas on 6/24/23.
//

import SwiftUI

struct InviteView: View {
    @State private var inviteCode: String = ""
    var body: some View {
        ScrollView {
            VStack {
                Text("Enter your invite code")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Bent requires an invitation from an existing community to get started.")

                TextField("Invite Code", text: $inviteCode, prompt: Text("Enter your invite code..."))
                    .multilineTextAlignment(.leading)
                    .textFieldStyle(.roundedBorder)

                Text("Don’t have an invite? Learn what you can do.")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
        .background(ignoresSafeAreaEdges: .all)
        .foregroundColor(.bentKindaWhite)
        .backgroundStyle(Color.bentSortaBlack)
        .safeAreaInset(edge: .bottom) {
            Button("Next") {

            }
            .buttonStyle(BentPrimaryButton())
            .padding()
        }
    }
}

struct InviteView_Previews: PreviewProvider {
    static var previews: some View {
        InviteView()
    }
}
