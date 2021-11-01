//
//  TranslationBubble.swift
//  Satuju
//
//  Created by Muhammad Rifki Widadi on 01/11/21.
//

import SwiftUI

struct TranslationBubble: View {
    @State var isOrigin: Bool
    var textTranslationInput: String
    var textTranslationResult: String
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            PolygonShapeView()
                .zIndex(1)
                .rotation3DEffect(!isOrigin ? .degrees(0) : .degrees(180), axis: (x: 0, y: 1, z: 0))
            VStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(textTranslationInput)
                        .font(
                            .custom("NotoSans-Bold", size: 15)
                        )
                    Divider()
                        .background(Color("Off-Color"))
                    Text(textTranslationResult)
                        .font(
                            .custom("NotoSans-Bold", size: 15)
                        )
                        .foregroundColor(Color("PurplePrimary"))
                }
                .environment(\.layoutDirection, .leftToRight)
                .frame(maxWidth: 278)
                VStack {
                    HStack {
                        Spacer()
                        ButtonReplayView {}
                    }
                    .environment(\.layoutDirection, .leftToRight)
                }
                .frame(maxWidth: 278)
            }
            .padding(.init(top: 24, leading: 32, bottom: 24, trailing: 32))
            .frame(maxWidth: 342, minHeight: 156)
            .background(Color.white)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 12
                )
            )
        .shadow(color: .black.opacity(0.25), radius: 10, x: 0, y: 6)
        }
        .flipsForRightToLeftLayoutDirection(false)
        .environment(\.layoutDirection, isOrigin ? .rightToLeft : .leftToRight)

    }
}

struct TranslationBubble_Previews: PreviewProvider {
    static var previews: some View {
        TranslationBubble(
            isOrigin: false,
            textTranslationInput: "This is two hundred won, i just want to know ypurhnekbjax",
            textTranslationResult: "Ini adalah dua ratus won")
            .previewLayout(.sizeThatFits)
            .padding()
        TranslationBubble(
            isOrigin: true,
            textTranslationInput: "This is two hundred won, i just want to know ypurhnekbjax",
            textTranslationResult: "Ini adalah dua ratus won")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
