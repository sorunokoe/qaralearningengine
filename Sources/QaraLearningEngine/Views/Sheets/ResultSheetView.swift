//
//  ResultSheetView.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 10.03.24.
//

import SwiftUI
import QaraDesignSystem

@MainActor
struct ResultSheetView: View {
    
    enum SheetType {
        case success, 
             failure(correctAnswer: String),
             warning
    }
    
    var type: SheetType

    var didSubmit: (() -> Void)
    
    @Binding var sheetContentHeight: CGFloat
    
    @ViewBuilder
    var body: some View {
        DynamicSheetView(content: {
            VStack {
                switch type {
                case .success:
                    SucccessSheetView {
                        didSubmit()
                    }
                case let .failure(correctAnswer):
                    FailureSheetView(correctAnswer: correctAnswer) {
                        didSubmit()
                    }
                case .warning:
                    WarningSheetView {
                        didSubmit()
                    }
                }
            }
        }, sheetContentHeight: $sheetContentHeight)
    }
    
}
