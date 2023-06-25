//
//  View+BentTitleToolbar.swift
//  BentTakeHome
//
//  Created by Jon Duenas on 6/25/23.
//

import SwiftUI

extension View {
    // Preferably this would be a Text object with a custom font
    func bentTitleToolbar() -> some View {
        self.navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image(.bentLogoTextAsset)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(12)
                        .accessibilityLabel("Bent")
                }
            }
    }
}
