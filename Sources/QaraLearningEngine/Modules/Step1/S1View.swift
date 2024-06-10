//
//  S1View.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 08.03.24.
//

import QaraDesignSystem
import SwiftUI

public struct S1View: StepView {
    @ObservedObject private var viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text(viewModel.method.title)
                .font(.system(size: 20, weight: .medium))
            Spacer()
            HStack(alignment: .center, spacing: 16) {
                Image(viewModel.method.icon)
                    .resizable()
                    .frame(width: 100, height: 100)
                VStack(alignment: .leading, spacing: 16) {
                    Button(action: {
//                        viewModel.speak(viewModel.lesson.sentence.value)
                    }, label: {
                        Image(systemName: "wave.3.forward.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                    })
                    Text(viewModel.lesson.word.value)
                        .font(.system(size: 20, weight: .medium))
                }
            }
            VStack(alignment: .leading, spacing: 8) {
                ForEach(viewModel.method.variants, id: \.self) { variant in
                    QaraButton(
                        text: variant,
                        backgroundColor: .clear,
                        foregroundColor: viewModel.getColor(for: variant),
                        stroke: (color: viewModel.getColor(for: variant), width: 1),
                        action: { viewModel.selectedVariant = variant }
                    )
                }
            }
            Spacer()
            QaraButton(
                text: "Check",
                backgroundColor: viewModel.selectedVariant == nil ? .gray : .green,
                foregroundColor: .white,
                action: {
                    if let selectedVariant = viewModel.selectedVariant {
                        viewModel.check(variant: selectedVariant)
                    }
                }
            )
            .disabled(viewModel.selectedVariant == nil)
        }
        .padding([.leading, .trailing], 32)
        //        .border(.blue)
        .sheet(isPresented: $viewModel.isPopupToShow, onDismiss: {
            viewModel.didFinish()
        }, content: {
            ResultSheetView(
                type: (viewModel.isCorrectAnswer ?? false) ? .success : .failure(correctAnswer: viewModel.method.answer),
                didSubmit: {
                    viewModel.isPopupToShow = false
                    viewModel.reset()
                },
                sheetContentHeight: $viewModel.sheetContentHeight
            )
            .presentationDetents([.height(viewModel.sheetContentHeight)])
            .presentationDragIndicator(.automatic)
            .interactiveDismissDisabled()
        })
    }
}

#if DEBUG
#Preview {
    S1View(viewModel: S1View.ViewModel(
        lesson: Lesson.mockS1(),
        method: S1Method.mock(),

        navigator: DefaultNavigator()
    ))
}
#endif
