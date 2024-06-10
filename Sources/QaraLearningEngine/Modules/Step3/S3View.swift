//
//  S3View.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 16.03.24.
//

import QaraDesignSystem
import SwiftUI

public struct S3View: StepView {
    @ObservedObject private var viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text(viewModel.method.title)
                .font(.system(size: 20, weight: .medium))
            Spacer()
            if viewModel.method.isNewWord {
                HStack(alignment: .center, spacing: 4, content: {
                    Image(systemName: "graduationcap.fill")
                    Text("NEW WORD")
                        .font(.system(size: 14, weight: .bold))
                })
                .foregroundStyle(.purple)
            }
            VStack(alignment: .leading, spacing: 16) {
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
                    HStack(alignment: .center, spacing: 4) {
                        Text(viewModel.lesson.word.value)
                            .font(.system(size: 20, weight: .medium))
                            .foregroundStyle(.black)
                            .onTapGesture {
                                
                            }
                            .frame(height: 11)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            WrappedWordsHStack(words: viewModel.construction) { word in
                Button(action: {
                    if viewModel.keys[word] ?? false {
                        viewModel.remove(word: word)
                    }
                }, label: {
                    Text(word)
                        .font(.system(size: 18))
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.blue.opacity(0.9))
                        )
                })
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            WrappedWordsHStack(words: viewModel.method.variants) { word in
                Button(action: {
                    if !(viewModel.keys[word] ?? false) {
                        viewModel.add(word: word)
                    }
                }, label: {
                    Text(word)
                        .font(.system(size: 18))
                        .padding(8)
                        .foregroundStyle((viewModel.keys[word] ?? false) ? .gray : .white)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill((viewModel.keys[word] ?? false) ? .gray : .blue.opacity(0.9))
                        )
                })
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)

            Spacer()
            QaraButton(
                text: "Check",
                backgroundColor: viewModel.construction.isEmpty ? .gray : .green,
                foregroundColor: .white,
                action: {
                    viewModel.check()
                }
            )
            .disabled(viewModel.construction.isEmpty)
        }
        .padding([.leading, .trailing], 32)
        .sheet(isPresented: $viewModel.isPopupToShow, onDismiss: {
            viewModel.didFinish()
        }, content: {
            ResultSheetView(
                type: .warning,
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
        .sheet(isPresented: $viewModel.isTranslationToShow, content: {
            if let item = viewModel.selectedTranslation {
                DynamicSheetView(content: {
                    LessonSheet(
                        value: item.0,
                        translation: item.1
                    ) {
                        viewModel.isTranslationToShow = false
                        viewModel.selectedTranslation = nil
                    }
                }, sheetContentHeight: $viewModel.sheetContentHeight)
                    .presentationDetents([.height(viewModel.sheetContentHeight)])
                    .presentationDragIndicator(.automatic)
                    .interactiveDismissDisabled()
            }
        })
    }
}

#if DEBUG
#Preview {
    S3View(viewModel: S3View.ViewModel(
        lesson: Lesson.mockS3(),
        method: S3Method.mock(),
        navigator: DefaultNavigator()
    ))
}
#endif
