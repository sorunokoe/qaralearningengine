//
//  FailureSheetView.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 10.03.24.
//

import SwiftUI

@MainActor
struct FailureSheetView: View {
    
    var correctAnswer: String
    var didSubmit: (() -> Void)
    
    @ViewBuilder
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .center, spacing: 16, content: {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                Text("Incorrect!")
                    .font(.system(size: 20, weight: .medium))
            })
            .foregroundColor(.red)
            VStack(alignment: .leading, spacing: 8, content: {
                Text("Correct answer:")
                    .font(.system(size: 18, weight: .medium))
                Text(correctAnswer)
                    .font(.system(size: 16, weight: .regular))
            })
            Button(action: {
                didSubmit()
            }, label: {
                Text("Got it")
                    .frame(maxWidth: .infinity)
                    .padding(16)
                    .foregroundStyle(.white)
                    .background(.red)
                    .clipShape(.rect(cornerSize: CGSize(width: 16, height: 16)))
            })
        }
        .padding(20)
    }
}

#Preview {
    FailureSheetView(correctAnswer: "Answer", didSubmit: {})
}
