//
//  BentTextFieldStyle.swift
//  BentTakeHome
//
//  Created by Jon Duenas on 6/25/23.
//

import SwiftUI

struct BentTextField<S: StringProtocol>: View {
    let title: S
    @Binding var text: String
    let prompt: Text?

    init(_ title: S, text: Binding<String>, prompt: Text? = nil) {
        self.title = title
        self._text = text
        self.prompt = prompt
    }

    var body: some View {
        TextField(title, text: $text, prompt: prompt)
            .textFieldStyle(.plain)
            .padding(16)
            .background()
            .backgroundStyle(Color(uiColor: .systemGray5))
            .cornerRadius(12)
    }
}

struct BentTextFieldStyle_Previews: PreviewProvider {
    struct Preview: View {
        @State private var text = ""

        var body: some View {
            BentTextField("Title", text: $text, prompt: Text("Prompt..."))
        }
    }

    static var previews: some View {
        Preview()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
