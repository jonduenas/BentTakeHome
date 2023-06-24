//
//  BentPrimaryButton.swift
//  BentTakeHome
//
//  Created by Jon Duenas on 6/24/23.
//

import SwiftUI

struct BentPrimaryButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.bentSortaBlack)
            .padding(.horizontal, 20)
            .padding(.vertical, 14)
            .frame(maxWidth: .infinity)
            .background(Color.bentMint)
            .cornerRadius(14)
    }
}

struct BentPrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        Button("Test"){}
            .buttonStyle(BentPrimaryButton())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
