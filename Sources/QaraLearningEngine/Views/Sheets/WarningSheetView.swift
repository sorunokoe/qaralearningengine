//
//  WarningSheetView.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 19.03.24.
//

import SwiftUI
import QaraDesignSystem

@MainActor
struct WarningSheetView: View {
    
    var didSubmit: (() -> Void)
    
    @ViewBuilder
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            VStack(alignment: .center, spacing: 8, content: {
                Text("You have 4 bayursaq left")
                    .font(.system(size: 22, weight: .medium))
                Text("Each mistake costs 1 bauyrsaq. You need bauyrsaq to finish a lesson.")
                    .font(.system(size: 18, weight: .regular))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
            })
            Button(action: {
                didSubmit()
            }, label: {
                Text("Keep going")
                    .frame(maxWidth: .infinity)
                    .padding(16)
                    .foregroundStyle(.white)
                    .background(.blue)
                    .clipShape(.rect(cornerSize: CGSize(width: 16, height: 16)))
            })
        }
        .padding(20)
    }
}

#Preview {
    WarningSheetView(didSubmit: {})
}
