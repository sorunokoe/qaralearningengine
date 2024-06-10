//
//  LessonSheet.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 19.03.24.
//

import SwiftUI
import QaraDesignSystem

@MainActor
struct LessonSheet: View {
    
    var value: String
    var translation: String
    var didSubmit: (() -> Void)
    
    @ViewBuilder
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8, content: {
                Text(value)
                    .font(.system(size: 20, weight: .regular))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                Text(translation)
                    .font(.system(size: 20, weight: .medium))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
            })
            Button(action: {
                didSubmit()
            }, label: {
                Text("Got it")
                    .frame(maxWidth: .infinity)
                    .padding(16)
                    .foregroundStyle(.white)
                    .background(.purple)
                    .clipShape(.rect(cornerSize: CGSize(width: 16, height: 16)))
            })
        }
        .padding(20)
    }
}

#Preview {
    LessonSheet(value: "Қалың қалай?",
                translation: "How are you?") {
        
    }
}
