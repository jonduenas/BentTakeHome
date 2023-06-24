//
//  BentSecondaryButton.swift
//  BentTakeHome
//
//  Created by Jon Duenas on 6/24/23.
//

import SwiftUI

struct BentSecondaryButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.bentMint)
            .padding(.horizontal, 20)
            .padding(.vertical, 14)
    }
}

struct BentSecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        Button("Secondary") {}
            .buttonStyle(BentSecondaryButton())
    }
}
