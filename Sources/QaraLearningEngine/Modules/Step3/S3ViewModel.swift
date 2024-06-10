//
//  S3ViewModel.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 16.03.24.
//

import SwiftUI

extension S3View {
    
    class ViewModel: ObservableObject {
        
        public let lesson: Lesson
        public let method: S3Method
        private let navigator: Navigator
        
        @Published var isPopupToShow: Bool = false
        @Published var selectedVariant: String?
        @Published var isCorrectAnswer: Bool?
        @Published var sheetContentHeight: CGFloat = 0
        
        @Published var keys: [String: Bool] = [:]
        @Published var construction: [String] = []
        
        @Published var isTranslationToShow: Bool = false
        @Published var selectedTranslation: (String, String)?
        
        init(lesson: Lesson, method: S3Method, navigator: Navigator) {
            self.lesson = lesson
            self.method = method
            self.navigator = navigator
        }
        
        func check() {
            let isCorrectAnswer = construction.joined(separator: " ") == method.answer
            UINotificationFeedbackGenerator().notificationOccurred(isCorrectAnswer ? .success : .error)
            self.isCorrectAnswer = isCorrectAnswer
            isPopupToShow = true
        }
        
        func speak(_ content: String) {

        }
        
        func reset() {
            construction.removeAll()
            keys.removeAll()
            selectedVariant = nil
            isCorrectAnswer = nil
        }
        
        func add(word: String) {
            construction.append(word)
            keys[word] = true
        }
        
        func remove(word: String) {
            construction.removeAll { $0 == word }
            keys[word] = false
        }
        
        func didFinish() {
            navigator.didFinishStep()
        }
        
        func getStyle(for element: String) -> Color {
            guard (lesson.sentence.translation[element] != nil) else { return .black }
            return .purple
        }
        
        func selectForTranslation(word: String) {
            if let translation = lesson.sentence.translation[word] {
                selectedTranslation = (word, translation)
                isTranslationToShow = true
            }
        }
    }
    
}

