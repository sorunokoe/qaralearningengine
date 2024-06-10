//
//  S1ViewModel.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 10.03.24.
//

import SwiftUI

extension S1View {
    
    class ViewModel: ObservableObject {
        
        public let lesson: Lesson
        public let method: S1Method
        private let navigator: Navigator
        
        @Published var isPopupToShow: Bool = false
        @Published var selectedVariant: String?
        @Published var isCorrectAnswer: Bool?
        @Published var sheetContentHeight: CGFloat = 0
        
        init(lesson: Lesson, 
             method: S1Method,
             navigator: Navigator) {
            self.lesson = lesson
            self.method = method
            self.navigator = navigator
        }
        
        func check(variant: String) {
            let isCorrectAnswer = variant == method.answer
            UINotificationFeedbackGenerator().notificationOccurred(isCorrectAnswer ? .success : .error)
            self.isCorrectAnswer = isCorrectAnswer
            isPopupToShow = true
        }
        
        func speak(_ content: String) {
            
        }
        
        func getColor(for variant: String) -> Color {
            if selectedVariant == variant {
                if let isCorrectAnswer {
                    return isCorrectAnswer ? .green : .red
                }
                return .blue
            }
            return .gray
        }
        
        func reset() {
            selectedVariant = nil
            isCorrectAnswer = nil
        }
        
        func didFinish() {
            navigator.didFinishStep()
        }
        
    }
    
}

