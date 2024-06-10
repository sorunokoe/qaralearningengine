//
//  SuccessSheetView.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 10.03.24.
//

import SwiftUI

@MainActor
struct SucccessSheetView: View {
    
    var didSubmit: (() -> Void)
    
    @ViewBuilder
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .center, spacing: 16, content: {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                Text("Great job!")
                    .font(.system(size: 20, weight: .medium))
            })
            .foregroundColor(.green)
            Button(action: {
                didSubmit()
            }, label: {
                Text("Continue")
                    .frame(maxWidth: .infinity)
                    .padding(16)
                    .foregroundStyle(.white)
                    .background(.green)
                    .clipShape(.rect(cornerSize: CGSize(width: 16, height: 16)))
            })
        }
        .padding(20)
    }
}

#Preview {
    SucccessSheetView { }
}
