//
//  Step2View.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 14.03.24.
//

import QaraDesignSystem
import SwiftUI

public struct S2View: StepView {
    @ObservedObject private var viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(viewModel.method.title)
                .font(.system(size: 20, weight: .medium))
            HStack(alignment: .center, spacing: 16) {
                Button(action: {
//                    viewModel.speak(viewModel.lesson.sentence.value)
                }, label: {
                    Image(systemName: "wave.3.forward.circle.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                })
                Text(viewModel.lesson.word.value)
                    .font(.system(size: 20, weight: .medium))
            }
            GeometryReader { geo in
                LazyVGrid(columns: [
                    GridItem(.fixed(geo.size.width / 2)),
                    GridItem(.fixed(geo.size.width / 2)),
                ]) {
                    ForEach(viewModel.method.variants, id: \.id) { variant in
                        Button(action: {
                            viewModel.selectedVariant = variant.text
                        }, label: {
                            VStack(alignment: .center) {
                                Image(systemName: variant.image)
                                    .resizable()
                                    .frame(
                                        width: geo.size.width / 2 - 32,
                                        height: geo.size.width / 2 - 32
                                    )
                                    .padding(16)
                                    .tint(viewModel.getColor(for: variant.text))
                                Text(variant.text)
                                    .font(.system(size: 20, weight: .medium))
                                    .padding(16)
                                    .foregroundColor(viewModel.getColor(for: variant.text))
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(.clear)
                                    .stroke(viewModel.getColor(for: variant.text), lineWidth: 1)
                            )
                        })
                    }
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
    S2View(viewModel: S2View.ViewModel(
        lesson: Lesson.mockS2(),
        method: S2Method.mock(),
        navigator: DefaultNavigator()
    ))
}
#endif
